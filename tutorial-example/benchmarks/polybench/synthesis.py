import os
import sys
import pandas as pd
import time
import subprocess
import re
import math
ROOT = os.getcwd()
STORE = ["adi", "jacobi-1d", "jacobi-2d", "seidel-2d", "heat-3d", "fdtd-2d", "durbin"]#["gesummv", "bicg", "atax", "syr2k", "syrk"]
HECTOR = "/home/ruifan/wuxi/hector/build/bin/hector-opt"
LIST = []
for dir in os.listdir():
    path = ROOT + "/" + dir
    if len(sys.argv) > 1 and dir != sys.argv[1] : continue
    #if dir in STORE: continue
    if os.path.isdir(path):
        print("Synthesis dir:", dir)
        os.chdir(path)
        #os.system("rm *.mlir *.tcl *.json")
        with open("scf.tcl", "w") as file:
            file.write("load scf.json\n")
            file.write("call main\n")
            file.write("c\n")
            file.write("exit")
        with open("tor.tcl", "w") as file:
            file.write("load tor.json\n")
            file.write("call main\n")
            file.write("c\n")
            file.write("exit")
        with open("hec.tcl", "w") as file:
            file.write("load hec.json\n")
            file.write("call main\n")
            file.write("c\n")
            file.write("exit")
        os.system("cgeist {}-hls.c -function=kernel_{} -S -memref-fullrank -o affine.mlir".format(dir, dir.replace("-", "_")))
        kernel = "kernel_" + dir
        print(kernel)
        if False:
            #scf = os.popen("hector-opt modify_scf.mlir --allow-unregistered-dialect --array-flatten=top-function={} --scf-for-to-while".format(kernel.replace('-', '_'))).read()
            #scf = os.popen("hector-opt affine.mlir --allow-unregistered-dialect --lower-affine-for --mem-to-iter-args --array-flatten=top-function={} --scf-for-to-while".format(kernel.replace('-', '_'))).read()
            shapes = re.findall(r'memref<(\d+)x', scf.split("\n")[1])
            with open("calyx_scf.mlir", "w") as file:
                file.write(scf)
            os.system("~/circt/build/bin/circt-opt --allow-unregistered-dialect calyx_scf.mlir --lower-scf-to-calyx=\"top-level-function={}\" -o calyx.mlir".format(kernel.replace('-', '_')))
            calyx = os.popen("~/circt/build/bin/circt-translate calyx.mlir --export-calyx").read()
            calyx_lines = calyx.split('\n')
            insert_mem = []
            for i in range(len(shapes)):
                insert_mem.append("    @external ext_mem{} = std_mem_d1(32, {}, {});".format(i, shapes[i], int(math.ceil(math.log2(int(shapes[i]))))))
            calyx_lines[1] = "//" + calyx_lines[1]
            calyx_lines[3] = re.sub("ext\_mem\w+: \d+, ?", "", calyx_lines[3])
            calyx_lines[3] = re.sub("\"toplevel\"=1,", "\"toplevel\"=1", calyx_lines[3])
            calyx_lines = calyx_lines[:5] + insert_mem + calyx_lines[5:]
            calyx = '\n'.join(calyx_lines)
            calyx = re.sub(r'(ext_mem\d+)_', r'\1.', calyx)
            with open("L1.futil", "w") as file:
                file.write(calyx)
            result = os.popen("fud e --to interpreter-out L1.futil -pr interpreter.interpret -csv -q").read()
            result = result[result.find(",")+1:]
            lower_result = os.popen("fud e --to interpreter-out L1.futil -s futil.flags \"-p all -x tdcc:no-early-transitions\" -pr interpreter.interpret -csv -q").read()
            lower_result = lower_result[lower_result.find(",")+1:]
            #lower_result = 0
            LIST.append([dir, result, lower_result])
            continue

        #print("cgeist {}-hls.c -function=kernel_{} -S -memref-fullrank -o affine.mlir".format(dir, dir.replace("-", "_")))
        os.system(HECTOR + " affine.mlir --allow-unregistered-dialect --lower-affine --convert-input=\"top-function=kernel_{} clock=6.0 resource=../resource.json\" -o input.mlir >& /dev/null".format(dir.replace("-", "_")))
        #os.system(HECTOR + " affine.mlir --allow-unregistered-dialect --affine-loop-unroll=\"unroll-factor=16\" --affine-loop-normalize --lower-affine --convert-input=\"top-function=kernel_{} clock=6.0 resource=../resource.json\" -o input.mlir >& /dev/null".format(dir.replace("-", "_")))
        #print("hector-opt affine.mlir --allow-unregistered-dialect --lower-affine --convert-input=\"top-function=kernel_{} clock=6.0 resource=../resource.json\" -o input.mlir >& /dev/null".format(dir))
        os.system(HECTOR + " input.mlir --dump-scf=\"json=scf.json\" --scf-to-tor -o scf.mlir")
        #os.system("time ~/hector-debugger/target/release/hector-debugger scf.tcl")
        os.system(HECTOR + " scf.mlir --schedule-tor --split-schedule --dump-tor=\"json=tor.json\" -o tor.mlir >& /dev/null")
        #os.system("time ~/hector-debugger/target/release/hector-debugger tor.tcl")
        os.system(HECTOR + " tor.mlir --generate-hec --canonicalize --dump-hec=\"json=hec.json\" -o hec.mlir >& /dev/null")
        start_time = time.time()
        os.system("time ~/hector-debugger/target/release/hector-debugger hec.tcl")
        os.system(HECTOR + " hec.mlir --dump-chisel=\"resource=../resource.json output-dir=main.scala\" > /dev/null")
        structure_time = time.time()-start_time
        print(structure_time)
        #os.system("mv *.scala /home/ruifan/wuxi/hector/rtl-generator/playground/test/src/example")
        #os.chdir("/home/ruifan/wuxi/hector/rtl-generator")
        #command = "mill playground.test.testOnly Testkernel_{}".format(dir.replace("-", "_"))
        #print(command)
        #result = subprocess.run(command, shell=True, capture_output=True, text=True)
        #print(result.stderr)
        LIST.append([dir, structure_time, time.time()-start_time])
os.chdir(ROOT)
df = pd.DataFrame(LIST,columns=['Benchmark','high calyx','low calyx'])
df.to_csv("exp.csv")

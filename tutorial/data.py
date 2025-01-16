import os
import time
import subprocess
import pandas as pd

cur_path = os.getcwd()
hestia = "~/hestia/target/release/hestia"

def execute_cmd(cmd):
    start_time = time.time()
    process = subprocess.run(cmd, shell=True, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    end_time = time.time() 
    execution_time = end_time - start_time
    return execution_time

#Collection1
if not os.path.exists(cur_path+'/collection1.csv'):
    print("###Collection1:")
    os.chdir(cur_path+'/benchmarks/collection1')
    DATA1 = []
    for dir in os.listdir(os.getcwd()+"/command"):
        print("Evaluate", dir)
        data = {}
        data["name"] = dir
        data["software"] = execute_cmd(hestia+" command/"+dir+"/scf.tcl")
        data["schedule"] = execute_cmd(hestia+" command/"+dir+"/tor.tcl")
        data["structure"] = execute_cmd(hestia+" command/"+dir+"/hec.tcl")
        DATA1.append(data)
    os.chdir(cur_path)
    pd.DataFrame(DATA1).to_csv("collection1.csv", index=False)

#Collection2
if not os.path.exists(cur_path+'/collection2.csv'):
    print("###Collection2:")
    os.chdir(cur_path+'/benchmarks/collection2')
    DATA2 = []
    for dir in os.listdir(os.getcwd()+"/command"):
        print("Evaluate", dir)
        data = {}
        data["name"] = dir
        data["software"] = execute_cmd(hestia+" command/"+dir+"/scf.tcl")
        data["structure"] = execute_cmd(hestia+" command/"+dir+"/hec.tcl")
        DATA2.append(data)
    os.chdir(cur_path)
    pd.DataFrame(DATA2).to_csv("collection2.csv", index=False)

#Polybench
if not os.path.exists(cur_path+'/polybench.csv'):
    print('###Polybench:')
    DATA3 = []
    os.chdir(cur_path+'/benchmarks/polybench')
    for dir in os.listdir():
        if not os.path.isdir(cur_path+'/benchmarks/polybench/'+dir):
            continue
        os.chdir(cur_path+'/benchmarks/polybench/'+dir)
        print("Evaluate", dir)
        data = {}
        data["name"] = dir
        data["structure"] = execute_cmd(hestia+" hec.tcl")
        result = os.popen("fud e --to interpreter-out L1.futil -pr interpreter.interpret -csv -q").read()
        result = result[result.find(",")+1:]
        lower_result = os.popen("fud e --to interpreter-out L1.futil -s futil.flags \"-p all -x tdcc:no-early-transitions\" -pr interpreter.interpret -csv -q").read()
        lower_result = lower_result[lower_result.find(",")+1:]
        data["high_calyx"] = result
        data["low_calyx"] = lower_result
        DATA3.append(data)
    os.chdir(cur_path)
    pd.DataFrame(DATA3).to_csv("polybench.csv", index=False)

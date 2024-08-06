#load example/json/stencil2d/scf.json
#load example/json/stencil2d/tor.json
#load example/json/stencil2d/hec.json
#load_memory_file op_0 example/data/stencil_op_0.txt
#load_memory_file op_2 example/data/stencil_op_2.txt
#load_memory_file mem_global_0 example/data/stencil_op_0.txt
#load_memory_file mem_global_2 example/data/stencil_op_2.txt
#call main
#c
#exit

load example/json/stencil2d/hec_dyn.json
call main
valid in control
step
invalid in
c
exit
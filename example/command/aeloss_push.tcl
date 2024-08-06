#load example/json/aeloss_push/scf.json
#load example/json/aeloss_push/tor.json
#load example/json/aeloss_push/hec.json
#call main
#load_memory_file op_0 example/data/aeloss_pull/2.txt
#load_memory_file op_1 example/data/aeloss_pull/in_2.txt
#load example/json/aeloss_push/hec.json
#call main
#load_memory_file mem_global_0 example/data/aeloss_pull/2.txt
#load_memory_file mem_global_1 example/data/aeloss_pull/in_2.txt
#switch tor
#c
#exit

load example/json/aeloss_push/hec_dyn.json
call main
load_memory_file mem_0 example/data/aeloss_pull/2.txt
load_memory_file mem_1 example/data/aeloss_pull/in_2.txt
valid in control
ready out0
step
invalid in
c
exit
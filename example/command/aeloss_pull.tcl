load example/json/aeloss_pull/scf.json
#load example/json/aeloss_pull/tor.json
#load example/json/aeloss_pull/hec.json
#call main
load_memory_file op_0 example/data/aeloss_pull/0.txt
load_memory_file op_1 example/data/aeloss_pull/1.txt
load_memory_file op_3 example/data/aeloss_pull/in_2.txt
#load_memory_file mem_global_0 example/data/aeloss_pull/0.txt
#load_memory_file mem_global_1 example/data/aeloss_pull/1.txt
#load_memory_file mem_global_3 example/data/aeloss_pull/in_2.txt
#c
#exit

load example/json/aeloss_pull/hec_dyn.json
call main
load_memory_file mem_0 example/data/aeloss_pull/0.txt
load_memory_file mem_1 example/data/aeloss_pull/1.txt
load_memory_file mem_3 example/data/aeloss_pull/in_2.txt
valid in control
ready out0
step
invalid in
c
exit
load json/aeloss_push/hec_dyn.json
call main
load_memory_file mem_0 data/aeloss_pull/2.txt
load_memory_file mem_1 data/aeloss_pull/in_2.txt
valid in control
ready out0
step
invalid in
c
exit
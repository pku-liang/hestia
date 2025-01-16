load tor.json
load_memory_file op_0 data/C.txt
load_memory_file op_1 data/A.txt
load_memory_file op_2 data/B.txt
call main
load hec_wrong.json
#load hec.json
load_memory_file mem_global_0 data/C.txt
load_memory_file mem_global_1 data/A.txt
load_memory_file mem_global_2 data/B.txt
call main
load_equal equal.json
cosim
exit

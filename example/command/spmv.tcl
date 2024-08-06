#load example/json/spmv/scf.json
#load example/json/spmv/tor.json
load example/json/spmv/hec.json
call main
#load_memory_file op_1 example/data/spmv/in_1.txt
#load_memory_file op_2 example/data/spmv/in_2.txt
load_memory_file mem_global_1 example/data/spmv/in_1.txt
load_memory_file mem_global_2 example/data/spmv/in_2.txt
c
exit
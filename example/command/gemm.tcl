#load example/json/gemm/scf.json
load example/json/gemm/tor.json
#load example/json/gemm/hec.json
call main
#c
#mem op_1
#switch tor
#call main
#step 13
#var
c
#mem op_1
exit
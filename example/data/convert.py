import sys
import struct

in_file = sys.argv[1]
out_file = sys.argv[2]
infile = open(in_file, "r")
outfile = open(out_file, "w")

def hex2float(s):
    return struct.unpack('!d', bytes.fromhex(s))[0]

for line in infile.readlines():
    # print(hex2float(line), file=outfile)
    print(int(line, 16), file=outfile)
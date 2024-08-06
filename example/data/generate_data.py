import sys
import random
path = sys.argv[1]
num = int(sys.argv[2])
file = open(path, "w")
for i in range(num):
    print(random.randint(-512, 511), file=file)

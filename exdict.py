import random
import os
import sys
import re

FILE_NAME = 'webster1913.csv'
FILE_PATH = os.path.join(os.path.dirname(os.path.realpath(sys.argv[0])),
    FILE_NAME)

bytes_in_file = os.stat(FILE_PATH).st_size
random_byte = random.randint(0, bytes_in_file)
with open(FILE_PATH) as file:
    file.seek(random_byte)
    file.readline() # clears partial line
    for i in range(int(sys.argv[1])):
        print re.sub('\s\s+', ' ', file.readline())

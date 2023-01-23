# --------------------------------------------------------------------------
#
# Generate an output file from provided input file.
# Both files use a predefined format.
# Check provided README.md for usage examples.
#
# Author: Aggelos Stamatiou, May 2017
#
# This source code is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This software is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this source code. If not, see <http://www.gnu.org/licenses/>.
# --------------------------------------------------------------------------

import sys

# Arguments check
if len(sys.argv) != 3:
    print("Wrong number of arguments!")
    print("Usage: python converter.py {input_file} {output_file}")

print("Extracting cases from", sys.argv[1], "to", sys.argv[2])
f = open(sys.argv[1], "r")

# Extract how many pairs(cases) exist in the file
count = f.readline()
if not count:
    print("Malformed file!")
    f.close()
    quit()

count = int(count)
print("Cases in file:", count)

# Parse each pair of lines to a case
lines = []
for i in range(count):
    l1 = f.readline()
    l2 = f.readline()    
    if not l1 or not l2:
        print("Malformed file!")
        break
    
    l1 = list(l1)
    l1.remove('\n')
    l1 = str(l1).replace("'*'", "*")
    l2 = list(l2)
    l2.remove('\n')
    l2 = str(l2).replace("'*'", "*")
    
    lines.append("case(" + str(i + 1) + ", " + l1 + ", " + l2 + ").\n")

f.close()

# Write cases to output file
print("Parsing finished, writting to file...")
f = open(sys.argv[2], "w")
for line in lines:
    f.write(line)
    
f.close()

print("Program successfully finished!")

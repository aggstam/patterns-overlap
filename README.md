# patterns-overlap

Prolog solution for Problem B of Google Codejam Kickstart Round A 2017.
<br>
A python script is used to convert test set input file to a .pl file,
which is used as the test cases when executing the Prolog code.
<br>
Original test cases are also included for validating correctness.
<br>
This implementation is focused on showcasing solution simplicity using Prologs' recursion, not speed.
<br>
Test case execution is streamline via a Makefile:
- Convert test case input file into a .pl file with desired format using the python script.
- Execute prolog code and output to a file.
- Validate output file by performing *diff* on the output file and the test case output file.
<br>
Implementation requires *prolog* and *python* to be installed.

# Problem
Alice likes reading and buys a lot of books.
She stores her books in two boxes; each box is labeled with a pattern that matches the titles of all of the books stored in that box.
A pattern consists of only uppercase/lowercase English alphabet letters and stars (*).
A star can match between zero and four letters.
For example, books with the titles GoneGirl and GoneTomorrow can be put in a box with the pattern Gone**,
but books with the titles TheGoneGirl, Gonetomorrow, and GoneWithTheWind cannot.
<br>
Alice is wondering whether there is any book that could be stored in either of the boxes.
That is, she wonders if there is a title that matches both boxes' patterns.

## Input
The first line of the input gives the number of test cases, T. T test cases follow.
Each consists of two lines; each line has one string in which each character is either an uppercase/lowercase English letter or *.

## Output
For each test case, output one line containing Case #x: y,
where x is the test case number (starting from 1) and y is TRUE if there is a string that matches both patterns, or FALSE if not.

# Usage
```
% make
```
Makefile can be configured to use a different test case set and/or files.
If *CASES_FILE* is modified, you should also change line 6 *:- ensure_loaded(test_cases).* in the Prolog code,
to the other file name.

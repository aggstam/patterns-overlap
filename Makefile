CASES_FILE = test_cases.pl
OUTPUT_FILE = output.txt
TEST_FILE = test_data/sample_test_set_1/sample_ts1_input.txt
VALIDATION_FILE = test_data/sample_test_set_1/sample_ts1_output.txt
#TEST_FILE = test_data/test_set_1/ts1_input.txt
#VALIDATION_FILE = test_data/test_set_1/ts1_output.txt
#TEST_FILE = test_data/test_set_2/ts2_input.txt
#VALIDATION_FILE = test_data/test_set_2/ts2_output.txt

all:
	python converter.py $(TEST_FILE) $(CASES_FILE)
	swipl -s patterns_overlap.pl > $(OUTPUT_FILE)
	diff $(VALIDATION_FILE) $(OUTPUT_FILE)

clean:
	rm -f $(CASES_FILE) $(OUTPUT_FILE)

.PHONY: all clean

#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>
#include "is_token.cpp"
#include "get_input_file_lines.h"
#include "write_to_output_file.h"

using std::string, std::vector, std::cout, std::endl, std::fstream;

enum class TokenType {
	DataType,
	Main,
	OpeningParenthesis,
	ClosingParenthesis,
	Indentation,
	Return,
	IntegerLiteral
};

struct Token {
	TokenType type;
	string value;
};


int main (int argc, char *argv[]) {
	/*
		 1. Get input file lines
		 2. Tokenize
		 3. Parse
		 4. cpp generator
		 5. Write to output file
	*/


	string inputFileName;
	vector<string> lines = getInputFileLines(argc, argv, inputFileName);
	// getInputFileLines
	vector<Token> tokens = tokenize(lines);
	vector<string> cppLines = convertToCppLines(tokens);
	writeToOutputFile(cpp, )

	return 0;
}
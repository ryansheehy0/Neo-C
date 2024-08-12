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

vector<Token> tokenize(vector<string> lines) {
	vector<Token> tokens;

	for (string line : lines) {
		string buff = "";

		for (char c : line) {
			buff.push_back(c);

			if (isDataType(buff)) {
				tokens.push_back({TokenType::DataType, buff});
				buff.clear();
			}else if (isMain(buff)) {
				tokens.push_back({TokenType::Main, buff});
				buff.clear();
			}else if (isOpeningParenthesis(buff)) {
				tokens.push_back({TokenType::OpeningParenthesis, buff});
				buff.clear();
			}else if (isClosingParenthesis(buff)) {
				tokens.push_back({TokenType::ClosingParenthesis, buff});
				buff.clear();
			}else if (isIndentation(buff)) {
				tokens.push_back({TokenType::Indentation, buff});
				buff.clear();
			}else if (isReturn(buff)) {
				tokens.push_back({TokenType::Return, buff});
				buff.clear();
			}else if (isIntegerLiteral(buff)) {
				tokens.push_back({TokenType::IntegerLiteral, buff});
				buff.clear();
			}

		}
	}

	return tokens;
}

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
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <vector>
#include "is_token.cpp"
#include "get_input_lines.cpp"

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

vector<string> convertToCppLines(vector<Token> tokens) {
	vector<string> lines;
	vector<Token> tokenBuff;
	string line;

	for (Token token : tokens) {
		tokenBuff.push_back(token);

		if (tokenBuff[0].type == TokenType::DataType) {
			string dataType = tokenBuff[0].value;
			if (tokenBuff[1].type == TokenType::Main) {
				string main = tokenBuff[1].value;
				if (tokenBuff[2].type == TokenType::OpeningParenthesis) {
					string openingParenthesis = tokenBuff[2].value;
					if (tokenBuff[2].type == TokenType::ClosingParenthesis) {
						string closingParenthesis = tokenBuff[2].value;

						line = dataType + main + openingParenthesis + closingParenthesis + " {";
						lines.push_back(line);
						line.clear();
					}
				}
			}
		}


	// indentation
	// return
	// Integer Literal
	// Add semi-colon
	// Add new line
	// Add closing currly brackets
}

int main (int argc, char *argv[]) {
	vector<string> lines = getInputLines(argc, argv);
	// getInputFileLines
	vector<Token> tokens = tokenize(lines);
	vector<string> cppLines = convertToCppLines(tokens);
	// writeToOutputFile(cpp);

	return 0;
}
#include <tokenize.h>
#include <is_token.h>
#include <vector>

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
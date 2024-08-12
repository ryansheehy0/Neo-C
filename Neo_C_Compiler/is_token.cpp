#include "is_token.h"
#include <string>
using std::string;

bool isDataType(string buff) {
	if (buff == "int ") return true;
	return false;
}

bool isMain(string buff) {
	if (buff == "main") return true;
	return false;
}

bool isOpeningParenthesis(string buff) {
	if (buff == "(") return true;
	return false;
}

bool isClosingParenthesis(string buff) {
	if (buff == ")") return true;
	return false;
}

bool isIndentation(string buff) {
	if (buff == "\t") return true;
	if (buff == " ") return true;
	return false;
}

bool isReturn(string buff) {
	if (buff == "return ") return true;
	return false;
}

bool isIntegerLiteral(string buff) {
	for (char c : buff) {
		switch (c) {
			case '0':
			case '1':
			case '2':
			case '3':
			case '4':
			case '5':
			case '6':
			case '7':
			case '8':
			case '9':
				break;
			default:
				return false;
		}
	}
	return true;
}
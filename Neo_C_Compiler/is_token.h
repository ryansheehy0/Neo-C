#pragma once

#include <string>
using std::string;

bool isDataType(string buff);
bool isMain(string buff);
bool isOpeningParenthesis(string buff);
bool isClosingParenthesis(string buff);
bool isIndentation(string buff);
bool isReturn(string buff);
bool isIntegerLiteral(string buff);
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <optional>
#include <vector>

using namespace std;

enum class TokenType {
	Include,
	Function,
	Variable,
	Assignment
};

struct Token {
	TokenType type;
	optional<string> value;
};

vector<string> getWords(const string&);
vector<Token> tokenize(vector<string>);

int main (int argc, char *argv[]) {
	string inputFileName = argv[1];

	// Check arguments
	if (argc != 2) {
		cout << "Incorrect usage." << endl;
		cout << "sl <input.sl>" << endl;
		return 1;
	}

	// Read input file
	fstream inputFile(inputFileName);

	if (!inputFile) {
		cout << "Error opening " << inputFileName << endl;
		return 1;
	}

	// Get vector for each line
	vector<string> lines;
	string line;
	while (!getline(inputFile, line)) {
		lines.push_back(line);
	}
	inputFile.close();

	// Tokenize lines
	vector<Token> tokens = tokenize(lines);

	return 0;
}

vector<string> getWords(const string &str) {
	vector<string> words;
	string word;

	for (int i = 0; i < str.length(); i++) {
		char c = str[i];
		if (c == ' ') {
			words.push_back(word);
			word.clear();
			continue;
		}
		word += c;
	}

	return words;
}

vector<Token> tokenize(vector<string> lines) {
	vector<Token> tokens;
	int i;
	for (i = 0; i < lines.size(); i++) {
		vector<string> words = getWords(lines[i]);
		if (words[0] == "include") {
			optional<Token> includeToken = checkInclude(words);
			if (!includeToken) goto error;
			tokens.push_back(includeToken.value());
		}else if (words[0] == "func") {

		}else if (words[0] == "var") {

		}else{
			// Check assignment
		}
	}

	return tokens;

	error:
		cout << "Error on line: " << i + 1 << endl;
		exit(1);
}

string reduceStringVector(vector<string> vec) {
	string output;
	for (int i = 0; i < vec.size(); i++) {
		string str = vec[i];
		output += str;
	}
	return output;
}

optional<Token> checkInclude(vector<string> words) {
	string library = words[1];
	int size = library.size();
	if (library[0] != '<' && library[0] != '"') return {};
	if (library[size - 1] != '>' && library[size - 1] != '"') return {};

	Token token;
	token.type = TokenType::Include;
	token.value = reduceStringVector(words);
	return token;
}
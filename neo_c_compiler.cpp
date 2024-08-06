#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <optional>
#include <vector>

using namespace std;

enum TokenType {
	Include,
	Function,
	Variable,
	While,
	Do_While,
	Assignment,
	Break
};

struct Token {
	TokenType type;
	optional<string> value;
};

vector<string> wordize(const string &str) {// Convert the string into words
	vector<string> words;
	string word;

	for (int i = 0; i < str.length(); i++) {
		char c = str[i];

		if (c == ' ') {
			if (!word.empty()) {
				words.push_back(word);
				word.clear();
			}
			continue;
		}else if (c == '\n') {
			if (!word.empty()) {
				words.push_back(word);
				words.push_back("\n");
				word.clear();
			}
			continue;
		}

		word += c;
	}

	if (!word.empty()) {
		words.push_back(word);
	}

	return words;
}

vector<Token> tokenize(vector<string> words) {
	vector<Token> tokens;
	int lineNum = 1;

	for (int i = 0; i < words.size(); i++) {
		string word = words[i];

		if (word == "#include") {
			i++;
			string library = words[i];
			if (library[0] != '<' && library[0] != '"') goto error;
			if (library[library.length() - 1] != '>' && library[library.length() - 1] != '"') goto error;
			i++;
			word = words[i];
			if (word != "\n") goto error;

			lineNum++;
			Token token;
			token.type = Include;
			token.value = "#include " + library;
			tokens.push_back(token);
		}else if () {

		}else{
			goto error;
		}

	}
	return tokens;

	error:
		cout << "Error on line: " << lineNum << endl;
		exit(1);
}

int main (int argc, char *argv[]) {
	string inputFileName(argv[1]);

	// Check for arguments
		// Maybe add the option for a folder?
	if (argc != 2 || inputFileName.substr(inputFileName.length() - 3) != ".nc") {
		cout << "Incorrect usage." << endl;
		cout << "neo-c <input.nc>" << endl;
		return 1;
	}

	// Read in file
	fstream inputFile(inputFileName);

	if (!inputFile) {
		cout << "Error opening " << inputFileName << endl;
		return 1;
	}

	// Put file in string
	string contents;
	stringstream contents_stream;
	contents_stream << inputFile.rdbuf();
	contents = contents_stream.str();

	vector<string> words = wordize(contents);
	for (int i = 0; i < words.size(); i++) {
		cout << words.at(i) << endl;
	}

	inputFile.close();
	return 0;
}
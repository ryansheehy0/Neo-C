#include "get_input_file_lines.h"
#include <iostream>
#include <vector>
#include <fstream>
#include <string>
using std::string, std::vector, std::cout, std::ifstream;

string getFileExtention(string);

vector<string> getInputLines(int argc, char *argv[], string &inputFileName) {
	inputFileName = string(argv[1]);
	string fileExtention = getFileExtention(inputFileName);

	if (argc != 2 || fileExtention != ".nc") {
		cout << "Incorrect usage.\n";
		cout << "neo-c <input.nc>\n";
		exit(1);
	}

	ifstream inputFile(inputFileName);
	if (!inputFile) {
		cout << "Error opening " << inputFileName << "\n";
		exit(1);
	}

	vector<string> lines;
	string line;
	while (getline(inputFile, line)) {
		lines.push_back(line);
	}

	inputFile.close();
	return lines;
}

string getFileExtention(string fileName) {
	int lastDotPos = fileName.rfind('.');
	string fileExtention = fileName.substr(lastDotPos);
	return fileExtention;
}
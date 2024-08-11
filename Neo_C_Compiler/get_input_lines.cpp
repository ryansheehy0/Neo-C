#include <iostream>
#include <vector>
#include <fstream>
#include <string>
using std::string, std::vector, std::cout, std::endl, std::fstream;

vector<string> getInputLines(int argc, char *argv[]) {
	string inputFileName(argv[1]);

	// Check for arguments
		// Maybe add the option for a folder?
	if (argc != 2 || inputFileName.substr(inputFileName.length() - 3) != ".nc") {
		cout << "Incorrect usage." << endl;
		cout << "neo-c <input.nc>" << endl;
		exit(1);
	}

	// Read in file
	fstream inputFile(inputFileName);

	if (!inputFile) {
		cout << "Error opening " << inputFileName << endl;
		exit(1);
	}

	// Get each line of the file
	vector<string> lines;
	string line;
	while (getline(inputFile, line)) {
		lines.push_back(line);
	}

	inputFile.close();
	return lines;
}
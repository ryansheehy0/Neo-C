#include "write_to_output_file.h"
#include <iostream>
#include <vector>
#include <string>
#include <fstream>

using std::cout, std::ofstream, std::vector, std::string;

void writeToOutputFile(vector<string> lines, string outputFileName) {
	ofstream outputFile(outputFileName);
	if (!outputFile) {
		cout << "Error opening " << outputFileName << "\n";
		exit(1);
	}

	for (string line : lines) {
		outputFile << line << "\n";
	}

	outputFile.close();
	return;
}
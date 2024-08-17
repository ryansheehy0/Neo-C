#include <iostream>
#include <fstream>

using std::fstream;

int main() {
  fstream file1("file1");
  if (!file1) {
    cerr << "file1" << endl;
    return -1;
  }

  fstream file2("file2");
  if (!file2) {
    cerr << "file2" << endl;
    file1.close();
    return -1;
  }

  fstream file3("file3");
  if (!file3) {
    cerr << "file3" << endl;
    file1.close();
    file2.close();
    return -1;
  }

  file1.close();
  file2.close();
  file3.close();

	fstream file1;
	fstream file2;
	fstream file3;
	try {
		file1.open("file1");
		if (!file1) {
			throw "file1";
		}
		file2.open("file2");
		if (!file2) throw "file2";
		file3.open("file3");
		if (!file3) throw "file3";
	} catch(const char* e) {
		file1.close();
		file2.close();
		file3.close();
		std::cout << e << "\n";
		exit(1);
	}

  return 0;
}
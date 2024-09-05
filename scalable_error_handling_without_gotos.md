<table>
<tr>
<td width=275 style="vertical-align: top;">

```C++
/*Un-scalable cleanup code*/
#include <iostream>
#include <fstream>

using std::fstream, std::cerr;

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

  return 0;
}
/*
This code isn't scalable
because as the amount of
error checks increase,
the amount of repeated
clean up code also
increases.
*/
```

</td>

<td width=275 style="vertical-align: top;">

```C++
/*Scalable cleanup
code with gotos*/
#include <iostream>
#include <fstream>

using std::fstream, std::cerr;

int main() {
  int retval = 0;

  fstream file1("file1");
  if (!file1) {
    cerr << "file1" << endl;
    return -1;
  }

  fstream file2("file2");
  if (!file2) {
    cerr << "file2" << endl;
    retval = -1;
    goto clean_file1;
  }

  fstream file3("file3");
  if (!file3) {
    cerr << "file3" << endl;
    retval = -1;
    goto close_file2;
  }

  file3.close();
  close_file2:
    file2.close();
  close_file1:
    file1.close();

  return retval;
}
```

</td>

<td style="vertical-align: top;">

```C++
/*Scalable cleanup
code with a function*/
#include <iostream>
#include <fstream>

using std::fstream, std::cerr;

void cleanup(fstream file1, fstream file2 = NULL, fstream file3 = NULL) {
  file1.close();
  if (file2 != NULL) file2.close();
  if (file3 != NULL) file3.close();
}

int main(int argc, char *argv[]) {
  fstream file1("file1");
  if (!file1) {
    cerr << "file1" << endl;
    return -1;
  }

  fstream file2("file2");
  if (!file2) {
    cerr << "file2" << endl;
    cleanup(file1);
    return -1;
  }

  fstream file3("file3");
  if (!file3) {
    cerr << "file3" << endl;
    cleanup(file1, file2);
    return -1;
  }

  cleanup(file1, file2, file3);
  return 0;
}
```

</td>
  </tr>
</table>
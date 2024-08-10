# Neo-C
Neo-C is a programming language like C++, but tries to be pleasant to use. It compiles to C++ and can use C++ libraries. It isn't designed to be backwards compatible with C++.

<img src="./neo_c_logo.svg" width=400>

<!-- TOC -->

- [Match statements](#match-statements)
	- [Ranges](#ranges)
	- [Multiple cases](#multiple-cases)
	- [Breaks in match statements](#breaks-in-match-statements)
	- [Strings](#strings)
- [Importing and Exporting](#importing-and-exporting)
- [Automatic function hoisting](#automatic-function-hoisting)
- [Semi-colons and curly brackets](#semi-colons-and-curly-brackets)
- [For each loops](#for-each-loops)
	- [Ranged based for loops](#ranged-based-for-loops)
- [Classes](#classes)
- [Nested Comments](#nested-comments)
- [Do while loops](#do-while-loops)
- [Breaking out of nested loops](#breaking-out-of-nested-loops)
- [Removing gotos](#removing-gotos)
- [Multiple usings](#multiple-usings)

<!-- /TOC -->

## [Match statements](#neo-c)
Switch statements are often used to replace if-else statements, but they typically result in more lines of code due to the required break statements. Match statements are meant to solve this problem.
- You cannot use switch statements in Neo-C. Match statements are used instead.

The match statement is exactly like the switch statement, but the brakes are automatically included.

```C++
// Neo-C
match (var)
  case 1:
  case 2:
  default:

// C++
switch (var) {
  case 1:
    break;
  case 2:
    break;
  default:
    break;
}
```

### [Ranges](#neo-c)
It is common to perform an action with a range of inputs, such as all lowercase characters, uppercase characters, or digits. Therefore, you can use `...` in match statements to automatically create a range of cases.
- This only works for char or int literals

```C++
// Neo-C
match (var)
  case 'a'...'c':
    // Do something

// C++
switch (var) {
  case 'a':
  case 'b':
  case 'c':
    // Do something
    break;
}
```

### [Multiple cases](#neo-c)
Instead of using fall-throughs for multiple case labels, you can use a comma `,` to separate different comparisons that should execute the same block of code.

```C++
// Neo-C
match (var)
  case 'a', 'b':

// C++
switch (var) {
  case 'a':
  case 'b':
    break;
}
```

### [Breaks in match statements](#neo-c)
`break`s in switch statements cannot be used to break out of the loop containing the switch statement, but this can be done in match statements in Neo-C.

```C++
// Neo-C
while (1)
  match (1)
    case 1:
      break

// C++
while (1) {
  switch (1) {
    case 1:
      goto break_loop;
      break;
  }
}
break_loop:
```

### [Strings](#neo-c)
C++ doesn't support using strings in switch statements, but Neo-C does for match statements.
- Ranges(`...`) don't work for strings

```C++
// Neo-C
std::string str = "abc"
match (str)
  case "a", "ab":
    // Do something
  case "abc":
    // Do something

// C++
std::string str = "abc";
if (str == "a" || str == "ab") {
  // Do something
}else if (str == "abc") {
  // Do something
}
```

## [Importing and Exporting](#neo-c)
It's annoying to have a separate header file to define your exports, especially when you change a declaration in your code and then have to change it in the header file as well.

The `#export` keyword is used to automatically construct an .h file with the same name as the .nc file.

```C++
// Neo-C
#export int func()

// C++
#progma once
int func();
```

- These automatically have include guards(`#progma once`) added at the top.
- If `#export` is used in a .nc file, when it compiles into its .cpp file, then its header file is automatically included at the top. `#include "file.h"`

## [Automatic function hoisting](#neo-c)
When you define a function it is automatically given a function prototype at the start of the file to allow for automatic function hoisting. This prevents having to worry about matching the prototype and the declaration.

```C++
// Neo-C
int main()
  // Do something

void func(int arg)
  // Do something

// C++
void func(int);

int main() {
  // Do something
}

void func(int arg){
  // Do something
}
```

## [Semi-colons and curly brackets](#neo-c)
- Semi-colons cannot be used.
- Curly brackets cannot be used and are replaced by indentations.
	- You can use either tab or space indentation.

## [For each loops](#neo-c)
C++ doesn't have a simple way to loop through a C style array and get each element with its corresponding index. In Neo-C there is a special for loop syntax for these operations.

```C++
// Neo-C
std::string str = "This is a test."
for (char element, int index in str of size str.length())
  std::cout << element << std::endl

// C++
std::string str = "This is a test.";
for (int index = 0; index < str.length(); index++) {
  char element = str[index];
  std::cout << element << std::endl;
}
```

- This can also work for references.

```C++
// Neo-C
char abcs[26]
for (char &letter, int i in abcs of size 26)
  letter = 97 + i

// C++
char abcs[26];
for (int i = 0; i < 26; i++){
  char &letter = abcs[i];
  letter = 97 + i;
}
```

- This syntax is easy translated to english: for each `element` and `index` in `array` of size `size` do something.

### [Ranged based for loops](#neo-c)
You can still use ranged based for loops, but their syntax has been changed to better match the other ranged based for loop.

```C++
// Neo-C
for (int el in vec)
  // Do something

// C++
for (int el : vec) {
  // Do something
}
```

## [Classes](#neo-c)
In C++ it is often necessary to have arguments for your constructor where those arguments get automatically assigned to variables inside the class. It can be very annoying just reassigning variables. To solve this Neo-C has a different syntax for constructors and classes.
- You have to use `public`, `private`, or `protected` for each member in a class.

```C++
// Neo-C
enum Sex
  Male,
  Female,
  Other

class Person(public int age, public int height, private int weight, private Sex sex)
  public int getWeight()
    if (sex == Male)
      return weight
    else
      return -1

  public void setWeight(int weight)
    this->weight = weight

// C++
enum Sex {
  Male,
  Female,
  Other
};

class Person {
  private:
    int weight;
    Sex sex;
  public:
    int age;
    int height;

    Person(int age, int height, int weight, Sex sex) {
      this->age = age;
      this->height = height;
      this->weight = weight;
      this->sex = sex;
    }

    int getWeight() {
      if (sex == Male) {
        return weight;
      } else {
        return -1;
      }
    }

    void setWeight(int weight) {
      this->weight = weight;
    }
};
```

## [Nested Comments](#neo-c)
When you need to comment out a large chunk of code, but that code already has a multi-line comment in it, you have to remove the inner `*/`. This is annoying so Neo-C adds the ability to do nested multi-line comments.

```javascript
// Neo-C
/*
  /*inner comment*/
  This is also a comment
*/

// C++
/*
  /*inner comment
  This is also a comment
*/
```

## [Do while loops](#neo-c)
In C++, do and while statements are separated, with the condition being at the end. This means someone reading the code only knows the loop condition after reaching the end of the block. This could make it harder to understand what the code is doing. Additionally, without curly brackets, the ending while statement could easily be confused for a new while loop.

```C++
// Neo-C
do while (1)
  // Do something

// C++
do {
  // Do something
} while (1);
```

## [Breaking out of nested loops](#neo-c)
If you have a loop in a loop you can add an additional break statement to break out of both loops.

```C++
// Neo-C
for (auto el in vec)
  for (auto el2 in vec2)
    for (auto el3 in vec3)
      break break

// C++
for (auto el : vec) {
  for (auto el2 : vec2) {
    for (auto el3 : vec3) {
      goto break_loops;
    }
  }
  break_loops:
}
```

- These breaks can be strung together to break out of any amount of loops. Ex: `break break break` etc.
- If multiple multi-breaks are used inside the same function, a number is added to the end of the label to prevent conflicting goto jumps. Ex: `break_loops_1`, `break_loops_2`, etc.

## [Removing gotos](#neo-c)
`goto`s are removed from Neo-C because they can create very confusing code. However, there are some legitimate use cases for `goto`s.
1. Breaking out of nested loops
  - This has been replaced with `break break` etc.
2. Breaking out of a loop from a switch statement that is in that loop.
  - This has been replaced by allowing `break`s to work in match statements.
3. Error handling in a scalable way
  - This can be done with a cleanup function to achieve the same effect.

<table>
<tr>
<td width=275 style="vertical-align: top;">

```C++
/*Un-scalable cleanup code*/
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

using std::fstream;

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

using std::fstream;

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

## [Multiple usings](#neo-c)
It's not recommended to use `using namespace std;` in C++ because it can cause naming conflicts. If you don't want to repeatedly type `std::`, it's recommended to use `using std::cout;`, `using std::endl;`, etc, each on a separate lines. However, this can get annoying, so Neo-C allows you to put them on one line, separated by commas.

```C++
// Neo-C
using std::cout, std::endl

// C++
using std::cout;
using std::endl;
```
# Neo-C
Neo-C is a programming language like C++, but tries to be pleasant to use. It compiles to C++ and can use C++ libraries. It isn't designed to be backwards compatible with C++ or C.

<img src="./neo_c_logo.svg" width=400>

<!-- TOC -->

- [Semi-colons and curly brackets](#semi-colons-and-curly-brackets)
- [Match statements](#match-statements)
	- [Ranges](#ranges)
	- [Multiple cases](#multiple-cases)
	- [Breaks in match statements](#breaks-in-match-statements)
	- [Strings](#strings)
- [Importing and Exporting](#importing-and-exporting)
- [Automatic function hoisting](#automatic-function-hoisting)
- [For each loops](#for-each-loops)
	- [Ranged based for loops](#ranged-based-for-loops)
- [Classes and Structs](#classes-and-structs)
	- [Structs](#structs)
	- [Classes](#classes)
- [Nested Comments](#nested-comments)
- [Do while loops](#do-while-loops)
- [Breaking out of nested loops](#breaking-out-of-nested-loops)
- [Removing gotos](#removing-gotos)
- [Negative array indexing](#negative-array-indexing)
- [Template Literals](#template-literals)

<!-- /TOC -->

## [Semi-colons and curly brackets](#neo-c)
- Semi-colons cannot be used.
- Curly brackets cannot be used and are replaced by indentations.
	- You can use either tab or space indentation.
  - Indentation for labels such as `public:` are also necessary.

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

The `#export` keyword is used to automatically construct an .hpp file with the same name as the .nc file.

```C++
// Neo-C
#export int func()

// C++
#progma once
int func();
```

- These automatically have include guards(`#progma once`) added at the top.
- If `#export` is used in a .nc file, when it compiles into its .cpp file, then its own header file is automatically included at the top. `#include "file.hpp"`

## [Automatic function hoisting](#neo-c)
When you define a function it is automatically given a function prototype at the start of the file to allow for automatic function hoisting. This prevents having to worry about matching the prototype and the declaration.

```C++
// Neo-C
int main()
  func(1)

void func(int arg)
  // Do something

// C++
void func(int);

int main() {
  func(1);
}

void func(int arg){
  // Do something
}
```

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

## [Classes and Structs](#neo-c)

### [Structs](#neo-c)
In C++, the only difference between `struct`s and `class`es are whether they default to private or public. However, it is commonly recommend to only use `struct`s for storing related data together, and use a `class` when that data needs methods. Since this is already the norm in C++, Neo-C enforces this norm and doesn't allow `struct`s to have methods or use the `private` keyword.
- In Neo-C, `struct`s behave exactly like `struct`s in C.

### [Classes](#neo-c)
In C++, it's common to create a class where the constructor arguments are directly equal to private or public member variables. However, to do this in C++ it requires a lot of repetitive code, so Neo-C introduces a new syntax for creating classes.

```C++
// Neo-C
using std::string, std::cout, std::endl

class Book(private int copiesAvailable, public string title = "Unknown", public string author = "Unknown", public int pages = 0)
  public:
    Book
      // Initialization constructor code

    // Constructor overloading example
    Book(const Book& book) : title(book.title), author(book.author), pages(book.pages), copiesAvailable(100)

    void display()
      cout << "title: "  << title  << endl
      cout << "author: " << author << endl
      cout << "pages: "  << pages  << endl

// C++
using std::string, std::cout, std::endl;

class Book {
  private:
    int copiesAvailable;
  public:
    string title;
    string author;
    int pages;

    Book(int copiesAvailable, string title = "Unknown", string author = "Unknown", int pages = 0) : copiesAvailable(copiesAvailable), title(title), author(author), pages(pages) {
      // Initialization constructor code
    }

    Book(const Book& book) : title(book.title), author(book.author), pages(book.pages), copiesAvailable(100) {}

    void display() {
      cout << "title: "  << title  << endl
      cout << "author: " << author << endl
      cout << "pages: "  << pages  << endl
    }
}
```

- The initialization constructor is optional.
- If you want to create a private constructor you can put the initialization constructor in `private:`.

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
In C++, do and while statements are separated, with the condition being at the end. This means someone reading the code only knows the loop condition after reaching the end of the block. This could make it harder to understand what the code is doing. Additionally, without curly brackets, the ending while statement could easily be confused for a new while loop. So Neo-C puts the `do` and `while` on the same line.

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
- If multiple multi-breaks are used inside the same function, a number is added to the end of the label to prevent conflicting goto jumps. Ex: `break_loops_2`, `break_loops_3`, etc.

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

## [Negative array indexing](#neo-c)
In C++ there isn't an easy way to concisely index from the last element. Therefore, Neo-C introduces a special syntax to allow for this.

```C++
// Neo-C
std::vector<int> vec = {1, 2, 3}
int lastEl = vec-[1]
  // It can also work with variables
int index = 2
int secondToLastEl = vec-[index]

// C++
std::vector<int> vec = {1, 2, 3};
int lastEl = vec[vec.size() - 1];
int index = 2;
int secondToLastEl = vec[vec.size() - index];
```

## [Template Literals](#neo-c)
In C++ if you want to include a variable in a string you have to convert it to a string and concatenate it. This is annoying so Neo-C adds a special syntax to allow you to do this automatically, like many other languages.
- Use `${code}` to insert into a string.
- Strings can also span multiple lines.

```C++
// Neo-C
int x = 10;
string y = "10"
string str = "x: ${x}
y: ${y}"

// C++
int x = 10;
string y = "10";
string str = "x: " + to_string(x) + "\ny: " + y;
```

- `\${}` allows you to escape the template literal.
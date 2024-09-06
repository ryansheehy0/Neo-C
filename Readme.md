# Neo-C
Neo-C is a programming language like C++, but tries to have a consistent and pleasant to use syntax. It has relatively simple features and tries not to be overly complex. It isn't backwards compatible C++.

<img src="./neo_c_logo.svg" width=400>

<!-- TOC -->

- [Basic syntax](#basic-syntax)
- [Data Types](#data-types)
	- [Built in data types](#built-in-data-types)
	- [Built in string and array methods](#built-in-string-and-array-methods)
	- [Main function](#main-function)
- [Removal of operator overloading](#removal-of-operator-overloading)
- [Match statements](#match-statements)
	- [Ranges](#ranges)
	- [Multiple cases](#multiple-cases)
	- [Breaks in match statements](#breaks-in-match-statements)
	- [Strings](#strings)
- [Importing and Exporting](#importing-and-exporting)
	- [Built in/Standard libraries](#built-instandard-libraries)
- [Automatic function hoisting](#automatic-function-hoisting)
- [For each loops](#for-each-loops)
- [Containers](#containers)
	- [Structs](#structs)
	- [Classes](#classes)
	- [Interfaces](#interfaces)
	- [Objects](#objects)
- [Nested Comments](#nested-comments)
- [Do while loops](#do-while-loops)
- [Breaking out of nested loops](#breaking-out-of-nested-loops)
- [Removing gotos](#removing-gotos)
- [Template Literals](#template-literals)
- [Other changes](#other-changes)
- [All Keywords](#all-keywords)

<!-- /TOC -->

## [Basic syntax](#neo-c)
- Semi-colons cannot be used.
  - They are annoying to use and the ability to place multiple statements on one line is unnecessary.
- Curly brackets cannot be used and are replaced by indentations.
  - Curly brackets are unnecessary. When a language requires curly brackets, indentation is already used, so it might as well be enforced by the language.
	- You can either use tab or space indentation.
- Parenthesis cannot be used for conditionals.
  - They are unnecessary and often don't lead to more readable code.
  - Functions and classes still require `()` without space. Ex: `void func()`
- You cannot use underscores in entity names.
  - This essentially enforces camelCase and prevents snake_case.
  - They may only include lowercase and uppercase letters, as well as numbers, but cannot begin with a number.

## [Data Types](#neo-c)
C++ has two main problems with its default data types.

1. Data types don't have explicitly defined lengths.
  - Ex: An `int` can be 32 bits, or 64 bits depending upon the platform. This can be a problem on certain platforms if values are expected to exceed 32 bits.
2. Array types aren't built into the language.
  - C-style arrays have been replaced by `std::array` in modern C++, but `[]` creates a C-style array instead of an `std::array`.
  - Dynamic arrays(`std::vector`) and strings(`std::string`) aren't built into the language even when they are so commonly used.

### [Built in data types](#neo-c)
- `auto`
- `bool`
- `i8`, `i16`, `i32`, `i64`
  - C++: `int8_t`, `int16_t`, `int32_t`, `int64_t`
- `u8`/`char`, `u16`, `u32`, `u64`
  - C++: `uint8_t`, `uint16_t`, `uint32_t`, `uint64_t`
- `string`
  - C++: `std::string`
- type[size]
  - C++: `std::array` (Maybe not because the size has to be known at compile time.)
- type[dynamic]
  - C++: `std::vector`
- Arrays have to be declared using this syntax.

```C++
// Neo-c
i64[] arr = {1, 2, 3}
i64[3] arr2
i64[dynamic] dArray = {1, 2, 3}

// C++
std::array<int64_t, 3> arr = {1, 2, 3};
std::array<int64_t, 3> arr2;
std::vector<int64_t> dArray;
```

### [Built in string and array methods](#neo-c)
These are methods which are built into strings, arrays, and dynamic arrays.

| Method                                      | Description                                                                 |
|---------------------------------------------|-----------------------------------------------------------------------------|
| .size()                                     | Gets the size/length of the array.                                          |
| .at(index)                                  | Allows for negative array indexing. Ex: -1 is the last element.             |
| .allocate(size)                             | Sets the allocated memory size for the string or dynamic array.             |
| .allocation()                               | Gets the size of the allocated memory of the string or dynamic array.       |
| .push(value)                                | Pushes an element on the end.                                               |
| .pop()                                      | Removes and returns the last element on the end.                            |
| .unshift(value)                             | Puts an element on the beginning.                                           |
| .shift()                                    | Removes the first element and returns it.                                   |
| .subArray(startIndex, optional endIndex)    | Returns a sub array from startIndex to endIndex or the end of the array.    |
| .subString(startIndex, optional endIndex)   | Returns a string from startIndex to endIndex or the end of the string.      |
| .sort()                                     | Returns a sorted array from lowest to highest.                              |
| .reverse()                                  | Returns a reversed array.                                                   |
| .contains(value)                            | Does the value exist in the array?                                          |
| .bContains(value)                           | Contains function with binary search. Array is assumed to be sorted.        |
| .find(value)                                | Gets the index of the value. -1 if not found.                               |
| .bFind(value)                               | Binary search to get the index of the value. Array is assumed to be sorted. |
| .insert(index, value, optional value, etc.) | Inserts the value or values after the index.                                |
| .remove(index, optional howMany)            | Removes the element at index and the next howMany(defaults to 1).           |
| .fill(value, startIndex, optional endIndex) | Fills the range, or the rest of the array, with the value.                  |

| Methods that require function arguments | Description                                                                  |
|-----------------------------------------|------------------------------------------------------------------------------|
| .isEveryElement(function)               | Tests if every element passes the function.                                  |
| .isOneOrMoreElement(function)           | Tests if one or more elements passes the function.                           |
| .map(function)                          | Applies the function to each element of the array and returns that array.    |
| .filter(function)                       | Returns a filtered array. If the function returns true it gets filtered out. |

- The function passed to these methods should have at least one argument. There arguments can be `function(element, index, array)`

| Special string methods | Description                                           |
|------------------------|-------------------------------------------------------|
| .toUpperCase()         | Converts string to upper case.                        |
| .toLowerCase()         | Converts string to lower case.                        |
| .trimStart()           | Removes any white space in front of the string.       |
| .trimEnd()             | Removes any white space at the back of the string.    |
| .trim()                | Removes any white space in the front and at the back. |

| Conversion methods     | Description                                                                           |
|------------------------|---------------------------------------------------------------------------------------|
| .join(stringSeparator) | Concatenates the array into a single string, separated by the stringSeparator.        |
| .split(splitString)    | Divides a string into an array based on the occurrences of the specified splitString. |

- You can use `array1 + array2` or `string1 + string2` to do concatenation.

### [Main function](#neo-c)

```C++
// Neo-C
i32 main(string[dynamic] args) // It can only have the argument named args
  // or
i32 main()

// C++
int main(int argc, char* argv[]) {
  std::vector<std::string> args;
  for (int i = 0; i < argc; i++) {
    args.push_back(argv[i]);
  }
}
  // or
int main() {
}
```

- If argc and argv are used as other variable names, then the arguments are named differently so there's no naming conflict.

## [Removal of operator overloading](#neo-c)
It's important for a language to stay consistent with its syntax so people know what's built into the language and what isn't. Operator overloading can break this consistency and therefore it has been removed.
  - Ex: The `<<` in `std::cout << "Hello World\n";` can be confused with the left shift operator. It isn't clear if that special `<<` syntax is built into the language or comes from the library.

## [Match statements](#neo-c)
Switch statements are often used to replace if-else statements, but they typically result in more lines of code due to the required break statements. Match statements are meant to solve this problem.
- You cannot use switch statements in Neo-C. Match statements are used instead.

The match statement is exactly like the switch statement, but the brakes are automatically included.

```C++
// Neo-C
match var
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
match var
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
match var
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
while true
  match 1
    case 1:
      break

// C++
while (true) {
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
match str
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
C++ has some notable problems when it comes to importing and exporting with header files.
1. If you make a change to a definition in a cpp file you have to make the same corresponding change in the header file.
2. When you import/include a header file you are including everything in that file instead of only what you want to use.
3. When you use some code in an included header file, it isn't clear which header file that code belongs to.

In Neo-C you can using the `import` keyword and the `export` keyword to explicitly import or export what you want.
- Importing
  - `import Name <Library>` imports the entire Library under the object Name.
  - `import Name2 "./localFile.nc"` imports all of the exported entities in that local file under the object Name2.
  - `import {var, func} <Library>` imports only the exported entities with the name `var` and `func` from the Library.
  - `import Name3, {var, func} <Library>` imports `var` and `func` from Library and all of the exports in Library under the object Name3.
- Exporting
  - `export i64 var = 0` exports the i64 variable named `var`.
  - `export void func()` exports the function `func`.

### [Built in/Standard libraries](#neo-c)
- Terminal
	- print()
	- userInput()
	- printError()
- Math
  - abs()
  - sqrt()
- File
- Error
	- exit()
- Regex
- Convert
  - toI64()
- Thread
- Network
  - fetch
  - json
  - express like server
- Time
- HTML
  - JSX should be built into the language?
- GUI
- LinkedList
- Encrypt
  - random
  - sha256
- Test
- Bash
  - Running bash commands

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
In C++, including the index in a for-each loop isn't easy. Neo-C adds this capability.

```C++
// Neo-C
string str = "This is a test."

for char c in str
  // Loops through all the characters in the string

for char c, i64 i in str
  // Loops through all the characters and has the index

for i64 i = 0; i < 100; i++
  // You can also do normal for loops

// C++
string str = "This is a test.";

for (char c : str) {
  // Loops through all the characters in the string
}

for (int64_t i = 0; i < str.size(); i++) {
  char c = str[i];
  // Loops through all the characters and has the index
}

for (int64_t i = 0; i < 100; i++) {
  // You can also do normal for loops
}
```

- This can also work for reference variables.

```C++
// Neo-C
char[26] abcs
for char &letter, i8 i in abcs
  letter = 97 + i

// C++
char abcs[26];
for (int8_t i = 0; i < abcs.size(); i++){
  char &letter = abcs[i];
  letter = 97 + i;
}
```

## [Containers](#neo-c)

### [Structs](#neo-c)
In C++, the only difference between structs and classes are whether they default to private or public. However, it is commonly recommend to only use structs for storing related data together, and use a class when that data needs methods. Since this is already the norm in C++, Neo-C enforces this norm and doesn't allow structs to have methods and everything in them is public. In Neo-C structs behave similarly to structs in C.

### [Classes](#neo-c)
Neo-C makes 3 notable changes to classes

1. In C++, it's very common to create a class where the constructor arguments just are assigned directly to member variables. C++ provides a special syntax for this, but you still have to create those member variables. Neo-C adds a default constructor which automatically creates those member variables and assigns them.
2. In C++, `private:` and `public:` usually require another indentation or are put on the same line as the class. This can create extra indentation or funny looking styling. This could be replaced by specifying `private` or `public` for each member entity, however this tends to be very verbose and annoying. Instead, Neo-C defines private member entities by having an underscore in front and public entities by not having an underscore in front.
3. Inheritance has been removed from Neo-C and composition is recommended instead.
  - https://www.youtube.com/watch?v=hxGOiiR9ZKg
  - All the C++ keywords associated with inheritance have been removed. `protected`, `virtual`, `override`, `final`, `friend`

```C++
// Neo-C
class Book(i64 _copiesAvailable, string title = "Unknown", string author = "Unknown", i64 pages = 0)
  Book
    // Initialization constructor code. This is optional.

  Book(Book book) : _copiesAvailable(100), title(book.title), author(book.author), pages(book.pages)
    // Constructor overloading example.

  ~Book()
    // This is the destructor

  void display()
    print("title: ${title}\n")
    print("author: ${author}\n")
    print("pages: ${pages}\n")

// C++
class Book {
  private:
    int64_t _copiesAvailable;
  public:
    std::string title;
    std::string author;
    int64_t pages;

    Book(int64_t _copiesAvailable, std::string title = "Unknown", std::string author = "Unknown", int64_t pages = 0) : _copiesAvailable(_copiesAvailable), title(title), author(author), pages(pages) {
      // Initialization constructor code. This is optional.
    }

    Book(Book book) : _copiesAvailable(100), title(book.title), author(book.author), pages(book.pages) {
      // Constructor overloading example.
    }

    ~Book() {
      // This is the destructor
    }

    void display() {
      std::cout << "title: " + title + "\n";
      std::cout << "author: " + author + "\n";
      std::cout << "pages: " + to_string(pages) + "\n";
    }
}
```

### [Interfaces](#neo-c)
- Instead of using inheritance, Neo-C uses composition and interfaces.
- Add the `interface` keyword.
	- A class that only has virtual functions with = 0;

### [Objects](#neo-c)

## [Nested Comments](#neo-c)
When you need to comment out a large chunk of code that already contains a multi-line comment, you have to remove the inner `*/` in order to avoid breaking the comment. This can be annoying, so Neo-C supports nested multi-line comments.

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
In C++, do and while statements are separated, with the condition being at the end. This means someone reading the code only knows the loop condition after reaching the end of the block. This could make it harder to understand what the code is doing. Additionally, without curly brackets, the ending while statement could be easily confused for a new while loop. So Neo-C puts the `do` and `while` keywords on the same line.

```C++
// Neo-C
do while true
  // Do something at least once

// C++
do {
  // Do something at least once
} while (true);
```

## [Breaking out of nested loops](#neo-c)
If you have a loop in a loop you can add an additional break statement to break out of both loops.

```C++
// Neo-C
for auto el in arr
  for auto el2 in arr2
    for auto el3 in arr3
      break break

// C++
for (auto el : arr) {
  for (auto el2 : arr2) {
    for (auto el3 : arr3) {
      goto break_loops;
    }
  }
  break_loops:
}
```

- These breaks can be strung together to break out of any amount of loops. Ex: `break break break` etc.
- If multiple multi-breaks are used inside the same function, a number is added to the end of the label to prevent conflicting goto jumps. Ex: `break_loops_2`, `break_loops_3`, etc.

## [Removing gotos](#neo-c)
`goto`s are removed from Neo-C because they can create very confusing code. However, there are some legitimate use cases for `goto`s, but these have been addressed with Neo-C other features.
1. Breaking out of nested loops
  - This has been replaced with `break break` etc.
2. Breaking out of a loop from a switch statement that is in that loop.
  - This has been replaced by allowing `break`s to work in match statements.
3. Error handling in a scalable way
  - This can be done with a cleanup function to achieve a similar effect.

## [Template Literals](#neo-c)
In C++, if you want to include a variable in a string you have to convert it to a string and concatenate it. This is annoying so Neo-C adds a special syntax to allow you to do this automatically, like many other languages.
- Use `${code}` to insert into a string.
- Strings can also span multiple lines.

```C++
// Neo-C
i64 x = 10
string y = "10"
string str = "x: ${x}
y: ${y}"

// C++
int64_t x = 10;
string y = "10";
string str = "x: " + to_string(x) + "\ny: " + y;
```

- `\${}` allows you to escape the template literal.

## [Other changes](#neo-c)
- `**` can be used for exponents.
- `try` for a try-catch block can be on the same line

```C++
// Neo-C
try func()
catch (string error)
	// Handle error

// C++
try { func()
} catch (std::string error) {
	// Handle error
}
```

## [All Keywords](#neo-c)

|       |           |         |
|-------|-----------|---------|
| if    | class     | dynamic |
| for   | struct    | return  |
| while | interface |         |

- You can use C++ keywords as names, but when they are used they are mapped to different names.
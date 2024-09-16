# Neo-C
Neo-C is a programming language like C++, but tries to have a consistent and pleasant to use syntax. It has relatively simple features and tries not to be overly complex. It isn't backwards compatible C++.

- In order to implement syntax highlighting in vs code, copy and paste the **Neo_C_Syntax_Highlighter** folder in **~/.vscode/extensions/**

<img src="./neo_c_logo.svg" width=400>

<!-- TOC -->

- [Basic syntax](#basic-syntax)
	- [Naming Conventions](#naming-conventions)
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
	- [Structs and Unions](#structs-and-unions)
	- [Classes](#classes)
	- [Interfaces](#interfaces)
	- [Objects](#objects)
- [Enums](#enums)
- [Nested Comments](#nested-comments)
- [Do while loops](#do-while-loops)
- [Breaking out of nested loops](#breaking-out-of-nested-loops)
- [Template Literals](#template-literals)
- [Casting](#casting)
- [Error handling](#error-handling)
- [Other changes](#other-changes)
	- [Removing gotos](#removing-gotos)
- [All Keywords](#all-keywords)

<!-- /TOC -->

## [Basic syntax](#neo-c)
- Semi-colons cannot be used.
  - They are annoying and the ability to place multiple statements on one line is unnecessary.
- Curly brackets cannot be used and are replaced by indentations.
  - Curly brackets are unnecessary. When a language requires curly brackets, indentation is already used, so it might as well be enforced by the language.
	- You can either use tab or space indentation.
  - This language is designed to work with line wrap enabled. You cannot add new lines willy nilly.
- Parenthesis cannot be used for conditionals.
  - They are unnecessary and often don't lead to more readable code.
  - Functions and classes still require `()` without the space. Ex: `void func()` and not `void func ()`

### [Naming Conventions](#neo-c)
Neo-C enforces naming conventions because it keeps things more consistent which allows code to be read quicker. No name can start with underscores, besides [private members](#classes), or numbers. Names are case sensitive.

- Variables, functions, objects
  - camelCase
- Constants
  - SCREAMING_SNAKE_CASE
- Classes, Structs, Enums, Interfaces
  - PascalCase

## [Data Types](#neo-c)
C++ has some problems with its default data types.

1. Data types don't have explicitly defined lengths.
  - Ex: An `int` can be 32 bits, or 64 bits depending upon the platform. This can be a problem on certain platforms if values are expected to exceed 32 bits.
2. Dynamic arrays aren't built into the language.
  - Dynamic arrays(`std::vector`) and strings(`std::string`) aren't built into the language even when they are so commonly used. This can be annoying having to include such a common feature.
3. There are multiple ways of making arrays with `std::array` and C-style arrays.
  - Having multiple ways of creating arrays can be confusing and is unnecessary.
  - There are many benefits to using `std::array` over C-style arrays, but the size of `std::array`s cannot be defined at run time, therefore C-style arrays are sometimes used in C++.

```C++
int main(int argc, char** argv) {
  // This is valid
  int arr[argc];
  // This is invalid
  std::array<int, argc>;
}
```

### [Built in data types](#neo-c)
- `auto`
- `bool`
- `i8`, `i16`, `i32`, `i64`
  - C++: `int8_t`, `int16_t`, `int32_t`, `int64_t`
- `u8`/`char`, `u16`, `u32`, `u64`
  - C++: `uint8_t`, `uint16_t`, `uint32_t`, `uint64_t`
- `f32`, `f64`
  - C++: `float`, `double`
- `string`
  - C++: `std::string`
- type[size]
  - C++: `type name[size]`
- type[dynamic]
  - C++: `std::vector`
- Arrays have to be declared using this syntax.

```C++
// Neo-c
i64[] arr = {1, 2, 3}
i64[3] arr2
i64[dynamic] dArray = {1, 2, 3}

// C++
int64_t arr[] = {1, 2, 3};
int64_t arr2[3];
std::vector<int64_t> dArray = {1, 2, 3};
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
| .contains(value) or .includes(value)        | Does the value exist in the array?                                          |
| .bContains(value) or .bIncludes(value)      | Contains function with binary search. Array is assumed to be sorted.        |
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

- You can use `array1 + array2` or `string1 + string2` to do concatenation.

### [Main function](#neo-c)

```C++
// Neo-C
i32 main(string[] args)
  // or
i32 main()

// C++
int main(int arg_c, char** arg_v) {
  std::string args[arg_c];
  for (int i = 0; i < arg_c; i++) {
    args[i] = arg_v[i];
  }
}
  // or
int main() {
}
```

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
	- void print(string msg)
  - void printLine(string msg)
    - Automatically adds a new line to the end.
	- void printError(string msg)
  - void printLineError(string msg)
  - string userInput()
    - Doesn't return the new line in the string.
    - The new line does get output to the terminal.
- Math
  - abs()
  - sqrt()
- File
  - getFile(string fileName)
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
  - currentTime()
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
- There is also function hoisting in classes and objects

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
In C++, it's impossible to include the index in a for-each loop, which means you have to re-write the for loop. Neo-C adds this capability.

```C++
// Neo-C
i64[] arr = {1, 2, 3, 4}
i64[dynamic] dArr = {1, 2, 3, 4}

for i64 el in arr
  // For each loop in array
for i64 el in dArr
  // For each loop in dynamic array

for i64 el, i64 i in arr
  // For each loop with index in array
for i64 el, i64 i in dArr
  // For each loop with index in dynamic array

// C++
int64_t arr[] = {1, 2, 3, 4};
std::vector<int64_t> dArr = {1, 2, 3, 4};

for (int64_t* arr_ptr = arr; arr_ptr < arr + sizeof(arr) / sizeof(arr[0]); arr_ptr++) {
  int64_t el = *arr_ptr;
  // For each loop in array
}
for (int64_t el : dArr) {
  // For each loop in dynamic array
}

for (int64_t i = 0; i < sizeof(arr) / sizeof(arr[0]); i++) {
  int64_t el = arr[i];
  // For each loop with index in array
}
for (int64_t i = 0; i < arr.size(); i++) {
  int64_t el = arr[i];
  // For each loop with index in dynamic array
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

### [Structs and Unions](#neo-c)
In C++, the only difference between structs and classes are whether they default to private or public. However, it is commonly recommend to only use structs for storing related data together, and use a class when that data needs methods. Since this is already the norm in C++, Neo-C enforces this norm and doesn't allow structs to have methods and everything in them is public.
- In Neo-C, structs and unions behave similarly to structs and unions in C.

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

  Book(Book book)
    // Constructor overloading example.
    _copiesAvailable = 100
    title = book.title
    author = book.author
    pages = book.pages

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

    Book(Book book) {
      // Constructor overloading example.
      _copiesAvailable = 100;
      title = book.title;
      author = book.author;
      pages = book.pages;
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

- The `:` syntax to assign variables from a constructor isn't present in Neo-C because it's used for error handling instead.

### [Interfaces](#neo-c)
Composition and interfaces are preferred over inheritance because they allow the code to be more flexible (see [The Flaws of Inheritance](https://www.youtube.com/watch?v=hxGOiiR9ZKg)). Therefore, Neo-C removes inheritances and adds interfaces.
- Interfaces can only include public function declarations and public variable declarations. This includes declarations of Classes, Structs, Interfaces, and Unions, but does not include Objects or Enums because those automatically define variables.
  - Unlike other languages, Neo-C allows interfaces to include public variable declarations because they are somewhat equivalent to having getter and setter methods for a private variables. This eliminates the need for redundant getter and setter methods in interfaces.
- Multiple interfaces can be implemented with: `class Class() : Interface1, Interface2, Interface3`
  - This means the class must define all the declared functions in the interfaces.
- Interfaces cannot have other interfaces. This isn't allowed: `interface Interface1 : Interface2`

```C++
// Neo-C
interface Interface
  i64 var
  void func()

// C++
class Interface {
  public:
    int64_t var;
    virtual void func() = 0;
  private:
    Interface() {}
}
```

### [Objects](#neo-c)
Objects in Neo-C are like singletons in C++. There is only one instance of them. You can still make private members by include an underscore in front of the name. You access them like you would any other object.

```C++
// Neo-C
object obj
  string _privateVar
  string publicVar = "Example"

  void publicFunction()

// Accessing the object
obj.publicFunction()
obj.publicVar

// C++
class obj {
  public:
    static obj& get_object() {
      return object_instance;
    }

    void publicFunction(){
    }

    std::string publicVar = "Example";

  private:
    obj() {}
    static obj object_instance;

    std::string _privateVar;
}

// Accessing the object
obj.get_object().publicFunction();
obj.get_object().publicVar;
```

## [Enums](#neo-c)
- Can use array functions
- PascalCase for the names of enums
- SCREAM_CASE for value in enums
- `enum object`

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

## [Casting](#neo-c)
Casting can be thought of as a special syntax for conversion functions. Neo-C removes casting in order to simplify the language. Instead, Neo-C provides the Convert library that handles conversions explicitly between different types. There are no implicit conversions in Neo-C and all conversions must be performed deliberately using the Convert functions. These functions can throw errors if the conversion is not possible.
- Float literals have to have decimal points. Ex: `10.0`
- Integer literals cannot have decimal points. Ex: `10`

Errors:
: InvalidConversion, OutOfRange

Convert Library
- bool toBool(auto var)
- i8 toI8(auto var)
	- toI16(), toI32(), toI64()
- u8 toU8(auto var)
	- toChar(), toU16(), toU32(), toU64()
- f32 toF32(auto var)
	- toF64()
- string toString(auto var)
- string join(auto[] arr, string stringSeparator)
	- Concatenates the array into a single string, separated by the stringSeparator.
- T toEnum<enum T>(auto var)
- T toClass<class T>(auto var)
- T toStruct<struct T>(auto var)
- T toUnion<union T>(auto var)
- T toInterface<interface T>(auto var)
- T toPointer<auto* T>(auto var)
- auto[] toArray(auto var)
- auto[] split(string  str, string strSeparator)
	- Divides a string into an array based on the occurrences of the specified splitString.

Data is defined in the real world. Protocols are agreed upon standards used to extract information from that data.
For example, when you drive up to a traffic light, the color and whether the lights are on or off are the data. The protocol is: red light on equals stop, yellow light on equals slow down, and green light on equals maintain speed. The information is obtained when you see the lights, apply the protocol, and extract useful information that can be translated into an action.

In programming languages, the data is the underlying bits, the protocol is the data type, and the information extracted is how that data is used by different functions. When converting you can either change the underlying bits and keep the information the same, or you can keep the underlying bits the same and possibly have the information change.

```C++
f32 a = 1.5
// Change the underlying bits
i32 b = toI32(a) // 1
// Keep the underlying bits the same
i32 c = *toPointer<i32*>(&a) // 1069547520
```

## [Error handling](#neo-c)
If you want to crash the program when an error is detected you can simply use `exit(1)` from the Error library. However, what happens when you want to continue to run your code even when there's an error?

In C, functions often return -1 when there's an error. However, there are a few notable problems with this approach.
1. What if the function wants to return -1 as a valid result and not as an error.
2. There's no way to know what type of error occurred. You can't pass extra information along with -1.
3. A lot of boiler plate code is needed when you want to propagate errors upwards so that they can be handled by a higher level function.

```C++
f64 func()
  f64 result = func2()
  if result == -1
    // Handle error
  // Use result

f64 func2()
  f64 result = divide(1, 0)
  if result == -1
    return -1
  // Use result

f64 divide(f64 numerator, f64 denominator)
  if denominator == 0
    return -1
  return numerator / denominator
```

What's often done to solve the 1st and 2nd problems are to wrap the output of the function in an `Error<returnType, errorType>`, but this doesn't solve the 3rd problem. In fact, it worsens the amount of boiler plate code because now you have to wrap everything in an Error type.
- This is similar to how GoLang handles errors, but GoLang allows functions to return multiple values, one of which can be an error.

```C++
f64 func()
  Error<f64, string> result = func2()
  if result.error()
    string error = result
    // Handle error
  // Use result

Error<f64, string> func2()
  Error<f64, string> result = divide(1, 0)
  if result.error()
    return result
  // Use result

Error<f64, string> divide(f64 numerator, f64 denominator)
  if denominator == 0
    return {0, "Cannot divide by zero."}
  return {numerator / denominator, ""}
```

How most languages have solve these problems is through `try`, `catch`, and `throw`. Throwing an error allows that error to bubble up until it is caught by a corresponding catch statement. If it doesn't get caught, the program crashes.

```C++
f64 func()
  f64 result
  try
    result = func2()
  catch string error
    // Handle error
  // Use result

f64 func2()
  f64 result = divide(1, 0)
  // Use result

f64 divide(f64 numerator, f64 denominator)
  if denominator == 0
    throw "Cannot divide by zero."
  return numerator / denominator
```

`try`, `catch`, and `throw` removes a lot of the boilerplate code, but it introduces some more problems.
1. It isn't clear if a function can throw an error and what type of error it can throw.
2. It makes it easy to ignore errors, which results in them being discovered at run time instead of when the code is being written.

To solve these two problems, Neo-C requires functions to explicitly specify the types of errors they can throw using `void func() : errorType1, errorType2`. Any function calling another function that throws errors must also declare those error types if they remain uncaught.

```C++
f64 func()
  f64 result
  try
    result = func2()
  catch string error
    // Handle error
  // Use result

f64 func2() : string
  f64 result = divide(1, 0)
  // Use result

f64 divide(f64 numerator, f64 denominator) : string
  if denominator == 0
    throw "Cannot divide by 0."
  return numerator / denominator
```

One annoying thing about try-catch blocks is their scoping. Any variable declared within the block cannot be used outside of it. This is the case because a variable may not be declared if a function before it throws an exception. See [The Actual Dumbest Thing About Try/Catch](https://www.youtube.com/watch?v=Ppj0j-5v0Qg). As a result, you have to declare all variables before the try-catch block, which can be very annoying. To solve this, Neo-C allows single line `try` statements that don't create a new scope, allowing variables to be declared and then used after the `catch`.

```C++
f64 func()
  try f64 result = func2()
  catch string error
    // Handle error
  // Use result

f64 func2() : string
  f64 result = divide(1, 0)
  // Use result

f64 divide(f64 numerator, f64 denominator) : string
  if denominator == 0
    throw "Cannot divide by 0."
  return numerator / denominator
```

- Use `catch` for the default catch instead of `catch ...`

## [Other changes](#neo-c)
- `**` can be used for exponents.
- You have to put `const` before the data type. Ex: `const i64 var` and not `i64 const var`
- String literals are converted to a string and not a character array. `std::string("String literal")`
- Arrays and enums can be defined on multiple lines.

```C++
enum Enum {
  VALUE1,
  VALUE2,
  ETC
}
// or
string[] arr = {
  "Value 1",
  "Value 2",
  "Etc"
}
```
- Integer division by zero throws an error.

### [Removing gotos](#neo-c)
`goto`s are removed from Neo-C because they can create very confusing code. However, there are some legitimate use cases for `goto`s, but these have been addressed with Neo-C other features.
1. Breaking out of nested loops
  - This has been replaced with `break break` etc.
2. Breaking out of a loop from a switch statement that is in that loop.
  - This has been replaced by allowing `break`s to work in match statements.
3. Error handling in a scalable way
  - This is address with Neo-C error handling features.

## [All Keywords](#neo-c)
Neo-C simplifies C++ by removing many unnecessary keywords and features. Any C++ keyword or concept not listed here is not part of Neo-C.

- bool, i8, i16, i32, i64, u8, char, u16, u32, u64, f32, f64, string, dynamic
- auto, void
- const, true, false
- Control flow
  - if, else
  - for, in
  - do, while
  - match, case, default
  - break, continue
- import, export
- return
- interface, class, struct, union, this, object
- enum
- try, catch, throw

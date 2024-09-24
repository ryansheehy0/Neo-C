# Neo-C
Neo-C is a programming language like C++, but tries to have a consistent and pleasant to use syntax. C++ gives so many features to users that it becomes up to them how they want to program in C++. This often leads to inconsistency and over-complexity. In contrast, Neo-C has relatively simple features and tries not to be overly complex. It isn't backwards compatible C++.

- **Compile still in development.**
  - If there's a disagreement between the compiler and the documentation, then the documentation is correct.
- In order to implement syntax highlighting in vs code, copy and paste the **Neo_C_Syntax_Highlighter** folder in **~/.vscode/extensions/**.
- Neo-C files have the **.nc** file extension.

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
- [Automatic function hoisting](#automatic-function-hoisting)
- [For each loops](#for-each-loops)
- [Containers](#containers)
	- [Structs and Unions](#structs-and-unions)
	- [Classes](#classes)
- [Interfaces](#interfaces)
- [Enums](#enums)
- [Nested Comments](#nested-comments)
- [Do while loops](#do-while-loops)
- [Breaking out of nested loops](#breaking-out-of-nested-loops)
- [String Templates](#string-templates)
- [Templates](#templates)
- [Casting/Converting](#castingconverting)
- [Error handling](#error-handling)
- [Compile time operations](#compile-time-operations)
- [Heap memory](#heap-memory)
- [Other changes](#other-changes)
	- [Removing gotos](#removing-gotos)
	- [Things that throw errors](#things-that-throw-errors)
- [All Keywords](#all-keywords)

<!-- /TOC -->

## [Basic syntax](#neo-c)
- Semi-colons cannot be used.
  - They are annoying and the ability to place multiple statements on one line is unnecessary.
- Curly brackets cannot be used and are replaced by indentations.
  - Curly brackets are unnecessary. Indentation is already commonly used, so it might as well be enforced as the standard.
  - You can either use tab or space indentation.
  - This language is designed to work with line wrap enabled. You cannot add new lines willy nilly.
- Parenthesis cannot be used for conditionals.
  - They are unnecessary and often don't lead to more readable code.
  - Functions and classes still require `()` without the space. Ex: `void func()` and not `void func ()`

### [Naming Conventions](#neo-c)
Neo-C enforces naming conventions because it keeps things more consistent.
- Names cannot start with underscore or numbers.
- Names are case sensitive.

| Category                                                    | Naming convention |
|-------------------------------------------------------------|-------------------|
| Variables, Functions, Objects                               | camelCase         |
| Constants                                                   | SCREAMING_CASE    |
| Classes, Structs, Unions, Enums, Interfaces, Template types | PascalCase        |

## [Data Types](#neo-c)
C++ has some problems with its default data types, which Neo-C corrects.

1. Data types don't have explicitly defined lengths.
  - Ex: An `int` can be 32 bits, or 64 bits depending upon the platform. This can be a problem if the code expects `int` to be 64 bits, but the platform only supports 32 bits.
2. Dynamic arrays aren't built into the language.
  - Dynamic arrays(`std::vector`) and strings(`std::string`) aren't built into the language even when they are so commonly used. This can be annoying having to include such a common feature.
3. There are multiple ways of making arrays with `std::array` and C-style arrays.
  - Each style of creating arrays has different features and limitations, which can create confusion and unnecessary complexity.

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
  - C++: `String_`
- `type[size] name`
  - C++: `Array_<type> name = Array_(size);` or `Array_<type> name = Array_(anotherArray);`
- `type[dynamic] name`
  - C++: `DynamicArray_<type> name = DynamicArray_(size);` or `DynamicArray_<type> name = DynamicArray_(anotherArray);`

### [Built in string and array methods](#neo-c)

| Array, string, and dynamic array methods  | Description                                                                        |
|-------------------------------------------|------------------------------------------------------------------------------------|
| .size() or .length()                      | Gets the size/length.                                                              |
| .at(index)                                | Allows for negative array indexing. Ex: -1 is the last element.                    |
| .subArray(startIndex, optional endIndex)  | Returns a sub array from startIndex to endIndex or the end of the array.           |
| .subString(startIndex, optional endIndex) | Returns a string from startIndex to endIndex or the end of the string.             |
| .sort()                                   | Returns a sorted array/string from lowest to highest.                              |
| .reverse()                                | Returns a reversed array/string.                                                   |
| .contains(value) or .includes(value)      | Does the value exist in the array?                                                 |
| .bContains(value) or .bIncludes(value)    | Contains function with binary search. Array/string is assumed to be sorted.        |
| .find(value)                              | Gets the index of the value. -1 if not found.                                      |
| .bFind(value)                             | Binary search to get the index of the value. Array/string is assumed to be sorted. |
| .fill(value, start, optional end)         | Fills the value from the start index to the end index or to the end of the array.  |
| .isEveryElement(function)                 | Tests if every element passes the function.                                        |
| .isOneOrMoreElements(function)            | Tests if one or more elements passes the function.                                 |
| .map(function)                            | Applies the function to each element of the array and returns that array.          |
| .filter(function)                         | Returns a filtered array. If the function returns true it gets filtered out.       |

- The function passed to these methods have these arguments: `func(element, optional index, optional array)`

| String and dynamic array methods            | Description                                                           |
|---------------------------------------------|-----------------------------------------------------------------------|
| .allocate(size)                             | Sets the allocated memory size.                                       |
| .allocationSize()                           | Gets the allocation size of memory.                                   |
| .push(value)                                | Pushes an element on the end.                                         |
| .pop()                                      | Removes and returns the last element on the end.                      |
| .unshift(value)                             | Puts an element on the beginning.                                     |
| .shift()                                    | Removes the first element and returns it.                             |
| .insert(index, value, optional value, etc.) | Inserts the value or values at the index.                             |
| .remove(index, optional howMany)            | Removes the element at the index and the next howMany(defaults to 1). |

| String methods | Description                                           |
|----------------|-------------------------------------------------------|
| .toUpperCase() | Converts string to upper case.                        |
| .toLowerCase() | Converts string to lower case.                        |
| .trimStart()   | Removes any white space in front of the string.       |
| .trimEnd()     | Removes any white space at the back of the string.    |
| .trim()        | Removes any white space in the front and at the back. |

- You can use `array1 + array2` or `string1 + string2` to do concatenation.
- Methods can throw errors if the index is out of range.

## [Main function](#neo-c)
The main function doesn't have to return. If it doesn't then it's assumed to return 0.

```C++
// Neo-C
i32 main()
  // or
i32 main(string[] args)

// C++
int main() {}
  // or
int main(int arg_c, char** arg_v) {
  String_ args[arg_c] = String_()
  std::string args[arg_c];
  for (int i = 0; i < arg_c; i++) {
    args[i] = arg_v[i];
  }
}
```

## [Removal of operator overloading](#neo-c)
It's important for a language to stay consistent with its syntax so people know what's built into the language and what isn't. Operator overloading can break this consistency and therefore it has been removed from Neo-C.

- Ex: The `<<` in `std::cout << "Hello World\n";` can be confused with the left shift operator. It isn't clear if `<<` is built into the language or comes from a library.

## [Match statements](#neo-c)
Switch statements are often used to replace if-else statements, but they typically result in more lines of code due to the required break statements. Match statements are meant to solve this problem.
- You cannot use switch statements in Neo-C. Match statements are used instead.
- `:`s after cases cannot be used in Neo-C.

The match statement is exactly like the switch statement, but the brakes are automatically included.

```C++
// Neo-C
match var
  case 1
  case 2
  default

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

```C++
// Neo-C
match var
  case 'a'...'c'
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
  case 'a', 'b'

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
    case 1
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
string str = "abc"
match str
  case "a", "ab"
    // Do something
  case "abc"
    // Do something

// C++
String_ str = String_("abc");
if (str == "a" || str == "ab") {
  // Do something
}else if (str == "abc") {
  // Do something
}
```

## [Importing and Exporting](#neo-c)
C++ has some notable problems when it comes to importing and exporting with header files.

1. If you make a change to a definition in a cpp file you have to make the same corresponding change in the header file.
2. When you include a header file you are including everything in that file instead of only what you want to use.
3. When you use some code from an included header file, it isn't clear which header file that code comes from.

In Neo-C, you can use the `import` keyword and the `export` keyword to explicitly import or export what you want from other Neo-C files or libraries. You cannot have duplicate names in a Neo-C file.
- Importing
  - `import name <Library>` imports the entire Library under the object name.
  - `import name "./localFile.nc"` imports all of the exported entities in that local file under the object name.
  - `import {var, func} <Library>` imports only the exported entities with the name `var` and `func` from the Library.
  - `import name, {var, func} <Library>` imports `var` and `func` from Library and all of the exports in Library under the object name.
- Exporting
  - `export i64 var = 0` exports the i64 variable named `var`.
  - `export void func()` exports the function `func`.

See the [standard libraries](./standard_libraries.md) which are built into Neo-C.

## [Automatic function hoisting](#neo-c)
Neo-C allows for automatic function hoisting so that you can define functions below where they are actually used.

```C++
// Neo-C
i32 main()
  func(1)

void func(i64 arg)
  // Do something

// C++
void func(int64_t);

int main() {
  func(1);
}

void func(int64_t arg) {
  // Do something
}
```

## [For each loops](#neo-c)
In C++, it's impossible to include the index in a for each loop. In Neo-C, for each loops can include the index.

```C++
// Neo-C
i64[] arr = {1, 2, 3, 4}

for i64 el in arr
  // or
for i64 el, i64 i in arr

// C++
Array_<int64_t> arr = Array_({1, 2, 3, 4});

for (int64_t el : arr) {}
  // or
for (int64_t i = 0; i < arr.size(); i++) {
  int64_t el = arr[i];
}
```

## [Containers](#neo-c)
In Neo-C, there are only 3 ways of creating instance of structs, unions, or classes.

```C++
Container instance = Container()
  // or
Container instance()
  // or
Container instance
```

### [Structs and Unions](#neo-c)
In C++, the only difference between structs and classes are whether they default to private or public. However, it is commonly recommend to only use structs for storing related data together, and use a class when that data needs methods. Since this is already the norm in C++, Neo-C enforces this norm and doesn't allow structs to have methods and everything in them is public.
- In Neo-C, structs and unions behave similarly to structs and unions in C.

```C++
// Neo-C
struct Point(i64 x, i64 y)

Point pt = Point(10, 20)
  // or
Point pt(10, 20)
  // or
Point pt
pt.x = 10
pt.y = 20

// C++
struct Point {
  int64_t x;
  int64_t y;

  Point(int64_t x, int64_t y) : x(x), y(y) {}
  Point() {}
};

Point pt = Point(10, 20);
  // or
Point pt(10, 20);
  // or
Point pt;
pt.x = 10;
pt.y = 20;
```

### [Classes](#neo-c)
Neo-C makes 3 notable changes to classes:

1. In C++, it's very common to create a class where the constructor arguments just are assigned directly to member variables. Neo-C allows the arguments of the constructor to create the member variables automatically.
2. In C++, `private:` and `public` require another indentation or are put on the same line as the class which looks messy. Instead, Neo-C defines private member entities by having an underscore in front and public entities by not having an underscore in front.
3. Inheritance has been removed from Neo-C and composition is recommended instead.
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
    // Destructor

  void displayInfo()
    print("title: ${title}\n")
    print("author: ${author}\n")
    print("pages: ${pages}\n")

// C++
class Book {
  private:
    int64_t _copiesAvailable;
  public:
    String_ title = "Unknown";
    String_ author = "Unknown";
    int64_t pages = 0;

    Book() {}

    Book(int64_t _copiesAvailable, String_ = "Unknown", String_ author = "Unknown", int64_t pages = 0) : _copiesAvailable(_copiesAvailable), title(title), author(author), pages(pages) {
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
      // Destructor
    }

    void displayInfo() {
      std::cout << "title: " + title + "\n";
      std::cout << "author: " + author + "\n";
      std::cout << "pages: " + to_string(pages) + "\n";
    }
}
```

- The `:` syntax to assign variables from a constructor isn't present in Neo-C because it's used for error handling instead.
- The `this` keyword can be used to differentiate between a variable belonging to the class and a local variable.

## [Interfaces](#neo-c)
Composition and interfaces are preferred over inheritance because they allow code to be more flexible (see [The Flaws of Inheritance](https://www.youtube.com/watch?v=hxGOiiR9ZKg)). Therefore, Neo-C removes inheritances and adds interfaces.
- Unlike other languages, Neo-C allows interfaces to include variable declarations. This avoids the need for redundant setter and getter methods.
- Interfaces can be implemented with: `class Class() : Interface1, Interface2, Interface3`

```C++
// Neo-C
interface Interface
  i64 var
  Class c
  Struct s
  Union u
  // You cannot have enums because they define values.
  void func()

// C++
class Interface {
  public:
    int64_t var;
    Class c;
    Struct s;
    Union u;
    // You cannot have enums because they define values.
    virtual void func() = 0;
  private:
    Interface() {}
}
```

## [Enums](#neo-c)
Enums are a list of constants that are used to limit the values that can be assigned to a variable. For example, if you want to represent the states of a coin you can use a bool, but if you wanted to represent something with 3 or more states you would normally use an enum. Neo-C doesn't change too much about enums compared to C++, but it does change the syntax a bit because Neo-C doesn't have namespaces.

```C++
// Neo-C
enum DayOfTheWeek = {MON = 1, TUE, WED, THU, FRI, SAT, SUN}
DayOfTheWeek day = DayOfTheWeek.MON

enum Color = {RED, GREEN, BLUE}
Color color = DayOfTheWeek.MON // This gives a compiler error

// C++
enum class DayOfTheWeek = {MON = 1, TUE, WED, THU, FRI, SAT, SUN};
DayOfTheWeek day = DayOfTheWeek::MON;

enum class Color = {RED, GREEN, BLUE};
Color color = DayOfTheWeek.MON; // This gives a compiler error
```

- The default type for enum constants are i64
- You can change them by using the `:`. Ex: `enum Name : i32`.

## [Nested Comments](#neo-c)
In C++, when you need to comment out a large chunk of code that already contains a multi-line comment, you have to remove the inner `*/` in order to avoid breaking the comment. This can be annoying, so Neo-C supports nested multi-line comments.

```javascript
// Neo-C
/*
  /*Inner comment*/
  This is also a comment
*/

// C++
/*
  /*Inner comment
  This is also a comment
*/
```

## [Do while loops](#neo-c)
In C++, `do` and `while` statements are separated, with the condition being at the end. In a language without curly brackets, the ending while statement could be easily confused for a new while loop. So Neo-C puts the `do` and `while` keywords on the same line.

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
In Neo-C, if you have a loop nested in another loop, you can add an additional break statement to break out of both loops.

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

## [String Templates](#neo-c)
In C++, if you want to include a variable in a string, you have to convert it to a string and concatenate it. This is annoying so Neo-C adds the ability to insert code into strings.
- Strings can also span multiple lines.

```C++
// Neo-C
i64 x = 10
string y = "10"
string str = "x: ${x}
y: ${y}"

// C++
int64_t x = 10;
String_ y = "10";
String_ str = "x: " + to_string(x) + "\ny: " + y;
```

- `\${}` allows you to escape.

## [Templates](#neo-c)
In Neo-C, templates are simplified compared to C++, but they offer an additional feature that allows you to specify exactly which types are allowed for a template argument. You can define the allowed types using a pipe(`|`) symbol between them. For example, `void func<i8 | i16 | i32 Type>()` specifies that the template argument `Type` can only be one of the specified types(`i8`, `i16`, or `i32`).
- All templates have to be defined right after the name of the entity they apply to.

Keywords that specify the template types:
- `auto` - Allows any type.
- `bool`
- `i8`, `i16`, `i32`, `i64`
- `int` - The same as `i8 | i16 | i32 | i64`
- `u8`, `char`, `u16`, `u32`, `u64`
- `uint` - The same as `u8 | char | u16 | u32 | u64`
- `f32`, `f64`
- `float` - The same as `f32 | f64`
- `string`
- `class`, `struct`, `union`
- `interface`
- `enum`
- `[]`s for arrays, and `*`s for pointers

```C++
// Neo-C
Type add<int | uint | float Type>(Type value1, Type value2)
	return value1 + value2

add(1, 5)
  // or
add<i64>(1, 5)

// C++
// This feature is enforced by the Neo-C compiler and not the C++ compiler.
template <typename Type>
Type add(Type value1, Type value2) {
	return value1 + value2;
}

add<int64_t>(1, 5);
  // or
add<int64_t>(1, 5);
```

- If the type isn't specified and the arguments are literals, then Neo-C assumes them to be the largest type possible.
  - Ex: `add(1, 5)` is assumed to be of type `i64`. Or `add(1.0, 5.0)` is assumed to be of type `f64`.

## [Casting/Converting](#neo-c)
Casting can be thought of as a special syntax for conversion functions.
In Neo-C, casting has been replaced with the Convert Library.

doesn't have this special syntax and instead handles conversions through the Convert Library.
This simplifies the syntax of the language and allows for more consistency in handling error handlings.

Casting can be seen as a special syntax for conversion functions.
In Neo-C, casting is replaced with the Convert Library, which handles all conversions. This approach simplifies the language's syntax and ensures more consistent error handling.

Neo-C removes casting in order to simplify the language. Instead, Neo-C provides the Convert library that handles conversions explicitly between different types. There are no implicit conversions in Neo-C and all conversions must be performed deliberately using the Convert functions. These functions can throw errors if the conversion is not possible.

- There is no implicit casting/converting in C++.
  - Float literals have to have decimal points. Ex: `10.0`
  - Integer literals cannot have decimal points. Ex: `10`

Errors:
: OutOfRange, InvalidInputType

Convert Library
- `bool toBool<Type>(Type val)`
- `i8 toI8<Type>(Type val) : OutOfRange`
	- toI16, toI32, toI64
- `u8 toU8<Type>(Type val) : OutOfRange`
	- toChar, toU16, toU32, toU64
- `f32 toF32<Type>(Type val) : OutOfRange`
	- toF64
- `string toString<Type>(Type val)`

- `Enum toEnum<Enum, Type>(Type val) : OutOfRange, InvalidInputType`



- `char[] toArray(string val)`

- Cannot convert to an object. Object isn't a type.


dynamic
- interface, class, struct, union, this, object


- string join(T[] arr, string stringSeparator)
	- Concatenates the array into a single string, separated by the stringSeparator.
- T toEnum<enum T>(auto var) : OutOfRange
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

How most languages have solve these problems is through `try`, `catch`, and `throw`. Throwing an error allows that error to bubble up until it is caught by a corresponding catch statement. If it doesn't get caught, the program crashes. This removes a lot of boiler plate code.

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

## [Compile time operations](#neo-c)
In Neo-C, you can have functions be evaluated at compile time if the arguments to those functions can also be calculated at compile time. This can be done by putting the `compile` keyword before a function call.

```C++
i32 main()
	const i64 FIVE_FACTORIAL = compile factorial(5) // This is valid
	i64 var = 6
	const i64 SIX_FACTORIAL = compile factorial(var) // This is invalid because var isn't known at compile time.

i64 factorial(i64 value)
	if value == 1 return 1
	return value * factorial(value - 1)
```

Neo-C also allows constants to be copied and pasted by the compiler. The value of the constant has to be defined at compile time. This can be done using the `copy&paste` keyword.

```C++
copy&paste const i64 PI = 3.14
```

These two keywords can be combined to allow the values of constants to be calculated at compiled time and then copied and pasted into the code.

```C++
copy&paste const i64 FIVE_FACTORIAL = compile factorial(5)
```

## [Heap memory](#neo-c)
In C++, to allocate memory on the heap you use the `new` keyword. Once done being used, this heap memory has to then be deallocated with the `delete` keyword. This has 3 main problems.

1. Forgetting to call delete causing memory leaks.
2. Deleting memory twice.
3. Using memory that was already deleted.

To solve these problems Resource Acquisition is Initialization(RAII) was created. RAII is an idea in which a corresponding pointer on the stack is created when heap memory is allocated. When this pointer gets popped, aka goes out of scope, then the corresponding heap memory also gets deleted. This removes the need for a `delete` keyword and solves those 3 problems.

Neo-C removes the `new` and `delete` keywords and only allows heap memory to be created with a corresponding stack pointer. This can be done using the inbuilt `#` syntax.

```C++
// Neo-C
#i64 mem = 10
printLine(mem)

// C++
Heap_<int64_t> mem = Heap_(10);
std::cout << mem.get_() << "\n";
```

## [Other changes](#neo-c)
- `**` can be used for exponents.
- `->` is valid for double dereferencing pointers.
- You have to put `const` before the data type. Ex: `const i64 var` and not `i64 const var`
- String literals are converted to a string and not a character array.
- Arrays, enums, and importing can be defined on multiple lines.

```C++
import {
  toI8,
  toI16,
  toI32
} <Convert>
// or
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

- If, else if, and else can all be evaluated on one line.

```C++
// Neo-C
if x == 1 return 1
else if x == 2 return 2
else return 3

// C++
if (x == 1) return 1;
else if (x == 2) return 2;
else return 3;
```

### [Removing gotos](#neo-c)
`goto`s are removed from Neo-C because they can create very confusing code. However, there are some legitimate use cases for `goto`s, but these have been addressed with Neo-C other features.
1. Breaking out of nested loops
  - This has been replaced with `break break` etc.
2. Breaking out of a loop from a switch statement that is in that loop.
  - This has been replaced by allowing `break`s to work in match statements.
3. Error handling in a scalable way
  - This is address with Neo-C error handling features.

### [Things that throw errors](#neo-c)
- Integer division by zero throws an error.
- Integer overflowing or underflowing throws an error.
- `[]` indexing out of range.

## [All Keywords](#neo-c)
Neo-C simplifies C++ by removing many unnecessary keywords and features. Any C++ keyword or concept not listed here is not part of Neo-C.

- main
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
- class, struct, union, this
- interface
- enum
- int, uint, float
- try, catch, throw
- compile, copy&paste
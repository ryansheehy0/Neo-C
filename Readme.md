# Neo-C
Neo-C is a programming language that tries to solve all of my problems with C++.

It has three specific goals:
1. Force the user to code in a specific style
2. Simplify the syntax of C++
3. Solve specific problems of C++

It compiles to C++, so it can be just as efficient and work on the same platforms as C++.

- **Compiler still in development.**
- **Syntax Highlighting in VS Code:** Copy and paste `Neo_C_Syntax_Highlighter` folder in `~/.vscode/extensions/`

<img src="./neo_c_logo.svg" width=400>

<!-- TOC -->

- [Basic syntax](#basic-syntax)
	- [Enforced naming conventions](#enforced-naming-conventions)
- [Data Types](#data-types)
	- [Built in data types](#built-in-data-types)
	- [Built in string and array methods](#built-in-string-and-array-methods)
- [Main function](#main-function)
- [Removal of operator overloading](#removal-of-operator-overloading)
- [Match statements](#match-statements)
	- [Ranges](#ranges)
	- [Fall throughs](#fall-throughs)
	- [Multiple cases](#multiple-cases)
	- [Breaks](#breaks)
	- [Strings](#strings)
- [Importing and Exporting](#importing-and-exporting)
- [Automatic hoisting](#automatic-hoisting)
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
- [Heap memory](#heap-memory)
- [Compile time operations](#compile-time-operations)
- [Other changes](#other-changes)
	- [Removing gotos](#removing-gotos)
- [All Keywords](#all-keywords)

<!-- /TOC -->

## [Basic syntax](#neo-c)
- No semicolons
- Curly brackets replaced by new lines and indentations
  - Tabs and spaces can be used for indentation
- No parenthesis for conditionals(if, for, while, etc.)

### [Enforced naming conventions](#neo-c)

| Category                                                                  | Naming convention |
|---------------------------------------------------------------------------|-------------------|
| Variables, Functions                                                      | camelCase         |
| Constants, Enum values                                                    | SCREAMING_CASE    |
| Classes, Structs, Unions, Enums, Interfaces, Template types, Requirements | PascalCase        |

## [Data Types](#neo-c)
C++ has some problems with its default data types, which Neo-C corrects.

1. Data types don't have explicitly defined lengths.
    - Ex: An `int` can be 32 bits, or 64 bits depending upon the platform. This can be a problem if the code expects `int` to be 64 bits, but the platform only supports 32 bits.
2. Dynamic arrays and strings aren't built into the language.
3. There are multiple ways of creating arrays with `std::array` and C-style arrays.

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
  - C++: `Array_<type> name(size);` or `Array_<type> name(anotherArray);`
- `type[dynamic] name`
  - C++: `DynamicArray_<type> name(size);` or `DynamicArray_<type> name(anotherArray);`

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
| .binaryContains(value) or .binaryIncludes(value)    | Uses binary search. Array/string is assumed to be sorted.                |
| .find(value)                              | Gets the index of the value. -1 if not found.                                      |
| .binaryFind(value)                                  | Uses binary search. Array/string is assumed to be sorted.                |
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
- These methods can throw errors if the index is out of range.

## [Main function](#neo-c)
If the main function doesn't return, then it's assumed to return 0.

```C++
// Neo-C
i32 main()
  // or
i32 main(string[] args)

// C++
int main() {}
  // or
int main(int arg_c, char** arg_v) {
  String_ args(arg_c);
  for (int i = 0; i < arg_c ; i++) {
    args[i] = arg_v[i];
  }
}
```

## [Removal of operator overloading](#neo-c)
It's important for a language to stay consistent with its syntax so people know what's built into the language and what isn't. Operator overloading can break this consistency and therefore it has been removed from Neo-C.

- Ex: The `<<` in `std::cout << "Hello world!\n";` can be confused with the left shift operator. It isn't clear if `<<` is built into the language or comes from a library.

## [Match statements](#neo-c)
In C++, switch statements take up more lines because of the mandatory break statements. Neo-C replaces switch statements with match statements, which don't require the breaks.

```C++
// Neo-C
match var
  case 1: printLine(1)
  case 2:
    printLine(2)
  default: printLine("default")
    printLine("default")

// C++
switch (var) {
  case 1: std::cout << 1 << "\n";
    break;
  case 2:
    std::cout << 2 << "\n";
    break;
  default: std::cout << "default" << "\n";
    std::cout << "default" << "\n";
    break;
}
```

### [Ranges](#neo-c)
Neo-C allows you to do case ranges with constants. Such as all lowercase characters.

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

### [Fall throughs](#neo-c)
Since break statements are automatically included, you can use the `fall` keyword to fall through to the next case.

```C++
// Neo-C
match var
  case 1:
    // Do something
    fall
  case 2:
    // Do something else

// C++
switch (var) {
  case 1:
    // Do something
  case 2:
    // Do something else
    break;
}
```

### [Multiple cases](#neo-c)
Instead of always using `fall`, you can use a comma to separate different comparisons.

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

### [Breaks](#neo-c)
Breaks can be used in match statements to break out of an outer loop.

```C++
// Neo-C
while true
  match var
    case 1:
      break

// C++
while (true) {
  switch (var) {
    case 1:
      goto break_loop;
      break;
  }
}
break_loop:
```

### [Strings](#neo-c)
Strings can word in match statements.
- Ranges(`...`) don't work for strings

```C++
// Neo-C
string str = "abc"
match str
  case "a", "ab":
    // Do something
  case "abc":
    // Do something

// C++
String_ str("abc");
if (str == "a" || str == "ab") {
  // Do something
}else if (str == "abc") {
  // Do something
}
```

## [Importing and Exporting](#neo-c)
In C++, header files have some problems:
1. If you make a change to a definition in a cpp file, you have to make the same corresponding change in the header file.
2. When you include a header file, you are including everything in that file instead of only what you want to use.
3. When you use some code from an included header file, it isn't clear which header file that code comes from.

In Neo-C, there are no header files.

| Importing                            | Description                                                                |
|--------------------------------------|----------------------------------------------------------------------------|
| `import name <Library>`              | Imports all exported things from Library under the object `name`.          |
| `import name "file.nc"`              | Imports all exported things from file.nc under the object `name`.          |
| `import {var, func} <Library>`       | Imports only `var` and `func` from the Library.                            |
| `import name, {var, func} <Library>` | Imports all exported things from Library and `var` and `func` from library |

| Exporting            | Description                           |
|----------------------|---------------------------------------|
| `export i64 var = 0` | Exports the i64 variable named `var`. |
| `export void func()` | Exports the function `func`.          |

See the [standard libraries](./standard_libraries.md) built into Neo-C.

- Namespaces have been removed from Neo-C.

## [Automatic hoisting](#neo-c)
Neo-C allows for automatic function, class, interface, struct, and union hoisting so that you can use them above where they are defined.

```C++
// Neo-C
i32 main()
  func()

void func()

// C++
void func();

int main() {
  func();
}

void func() {
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
Array_<int64_t> arr({1, 2, 3, 4});

for (int64_t el : arr) {}
  // or
for (int64_t i = 0; i < arr.size(); i++) {
  int64_t el = arr[i];
}
```

## [Containers](#neo-c)

### [Structs and Unions](#neo-c)
In Neo-C, structs and unions cannot have methods and behave similarly to those in C.

```C++
// Neo-C
struct Point
  i64 x
  i64 y

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

- You cannot use `{}`s to initialize structs in Neo-C

### [Classes](#neo-c)
The changes Neo-C makes to classes:
1. `:`s for member initializer lists have been replaced with the `init` keyword.
2. `private:` has been replaced with an underscore in front. `public:` has been replace without an underscore in front.
3. Inheritance and all its associated keywords have been removed.

```C++
// Neo-C
class Book
  i64 _copiesAvailable
  string title
  string author
  i64 pages

  Book(i64 _copiesAvailable, string title = "Unknown", string author = "Unknown", i64 pages = 0)
  init _copiesAvailable(_copiesAvailable), title(title), author(author), pages(pages)
    // Constructor code

  ~Book()
    // Destructor

  void displayInfo() const
    printLine("title: ${title}")
    printLine("author: ${author}")
    printLine("pages: ${pages}")

// C++
class Book {
  private:
    int64_t _copiesAvailable;
  public:
    String_ title;
    String_ author;
    int64_t pages;

    Book(int64_t _copiesAvailable, String_ title = "Unknown", String_ author = "Unknown", int64_t pages = 0)
    : _copiesAvailable(_copiesAvailable), title(title), author(author), pages(pages) {
      // Constructor code
    }

    ~Book() {
      // Destructor
    }

    void displayInfo() const {
      std::cout << "title: " + title + "\n";
      std::cout << "author: " + author + "\n";
      std::cout << "pages: " + to_string(pages) + "\n";
    }
}
```

- The `this` keyword can be used and it behaves the same as in C++.
- Use the `.` to define methods outside of classes instead of `::`
  - `void Class.method()` instead of `void Class::method()`

## [Interfaces](#neo-c)
Composition and interfaces are preferred over inheritance because they allow code to be more flexible (see [The Flaws of Inheritance](https://www.youtube.com/watch?v=hxGOiiR9ZKg)). Therefore, Neo-C removes inheritances and adds interfaces.
- Unlike other languages, Neo-C allows interfaces to include variable declarations. This avoids the need for redundant setter and getter methods.
- Interfaces can be implemented with: `class Class() : Interface1, Interface2, Interface3`

```C++
// Neo-C
interface Interface
  i64 var
  void func()

// C++
class Interface {
  public:
    int64_t var; // Enforced by the Neo-C compiler.
    virtual void func() = 0;
  private:
    Interface() {}
}
```

## [Enums](#neo-c)
There are 2 main problems with the regular `enum` in C++ that `enum class` was designed to solve:
1. Naming conflicts
    - You cannot reuse the names defined in the enum.
2. Implicit int conversion
    - Enums can be compared to or assigned from integers, which can case confusion and invalid values.

Because of these problems, Neo-C doesn't have a regular `enum` like in C++. `enum`s in Neo-C behave very similarly to `enum class` in C++.
- Enum names have to be in PascalCase.
- Enum values have to be in SCREAMING_CASE.

```C++
// Neo-C
enum DayOfTheWeek {MON = 1, TUE, WED, THU, FRI, SAT, SUN}
DayOfTheWeek day = DayOfTheWeek.MON

// C++
enum class DayOfTheWeek : int64_t {MON = 1, TUE, WED, THU, FRI, SAT, SUN};
DayOfTheWeek day = DayOfTheWeek::MON;
```

- The default underlying type is i64. You can change the default underlying type of the enum by doing `enum Name : type {}`

## [Nested Comments](#neo-c)
Neo-C allows for nested multi-line comments.

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
In Neo-C, since there are no curly brackets, the ending while statement for do-while loops could be confused with another while loop. So Neo-C, puts the do and while keywords on the same line.

```C++
// Neo-C
do while false
  // Do something at least once

// C++
do {
  // Do something at least once
} while (false);
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
Neo-C adds the ability to insert code into strings. Strings can also span multiple lines.

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
In Neo-C, templates are defined by placing angle brackets `<>`s after the name. The `auto` keyword can be used to define a template argument that accepts any type. This replaces C++'s `typename` and `class`.

```C++
auto add<auto Type1, auto Type2>(Type1 value1, Type2 value2)
  return value1 + value2
```

In Neo-C, you can create requirements for template arguments that are checked at compile time. Requirements can only have one template argument defined.

```C++
requirement Addable<auto Type>
  Type + Type

auto add<Addable Type1, Addable Type2>(Type1 value1, Type2 value2)
  return value1 + value2
```

The logical operators `&&`, `||`, `!`, and parentheses `()` are supported for combining requirements inside templates.

```C++
requirement Subtractable<auto Type>
  Type - Type

requirement Addable<auto Type>
  Type + Type

auto someMathFunc<Addable && Subtractable Type1, Addable && Subtractable Type2>(Type1 value1, Type2 value2)
  return value1 + value2 - value1
```

You can also define specific types required for template arguments.

```C++
requirement Int<i8 || i16 || i32 || i64 Type>
  Type
```

See the [requirement library](./requirement_library.md) for built in requirements.

## [Casting/Converting](#neo-c)
In Neo-C, there is no implicit casting/converting like in C++. All castings/conversions should be called like a function.
  - Float literals have to have decimal points. Ex: `f64 x = 10.0`
  - Integer literals cannot have decimal points. Ex: `i64 x = 10`

Converting to a **bool**:

```C++
bool bool<Int || UInt || Float || Pointer || String Type>(Type value)
```

Converting to an **integer**:

```C++
i8 i8<(Int && !i8) || UInt || Float || Pointer || String Type>(Type value) : OutOfRange
```

Converting to an **unsigned integer**:

```C++
u8 u8<Int || (UInt && !u8) || Float || Pointer || String Type>(Type value) : OutOfRange
```

Converting to a **float**:

```C++
f32 f32<Int || UInt || (Float && ! f32) || Pointer || String Type>(Type value) : OutOfRange
```


- f32, f64
  - OutOfRange
- string
- arrays?
  - `ReturnType[] array<ReturnType, Type>(Type val)`
- pointers?
- class
- struct
- union
- interface
- enum
  - `Enum enum<Enum, Type>(Type val) : OutOfRange`


Data is defined in the real world. Protocols are agreed upon standards used to extract information from that data.
For example, when you drive up to a traffic light, the color and whether the lights are on or off are the data. The protocol is: red light on equals stop, yellow light on equals slow down, and green light on equals maintain speed. The information is obtained when you see the lights, apply the protocol, and extract useful information that can be translated into an action.

In programming languages, the data is the underlying bits, the protocol is the data type, and the information extracted is how that data is used by different functions. When converting you can either change the underlying bits and keep the information the same, or you can keep the underlying bits the same and possibly have the information change.

```C++
f32 a = 1.5
// Change the underlying bits
i32 b = i32(a) // 1
// Keep the underlying bits the same
i32 c = *pointer<i32*>(&a) // 1069547520
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
- In classes, when you use `const` it has to be before any specified errors.
  - Ex: `void func() const : ErrorType`

## [Heap memory](#neo-c)
Not Done.

How can you transfer ownership? How do smart pointers transfer ownership?

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

## [Compile time operations](#neo-c)
In Neo-C, you can avoid worrying about functions or constants being executed at runtime when they can be computed during compile time. Specifically, the following conditions must be met for functions or constants to be processed at compile time:
1. Compile time functions:
  - All the arguments must be known at compile time.
  - The function is pure. It must not use any inputs other than the arguments. Ex: using a pointer, static variables, etc.
2. Compile time constants:
  - Its value must be known at compile time.
  - No other part of the program references it's address.

```C++
// Neo-C
const i64 FIVE_FACTORIAL = factorial(5)

i64 factorial(i64 value)
  if value == 0 return 1
  return value * factorial(value - 1)

// Compiled C++
const int64_t FIVE_FACTORIAL = 120;

int64_t factorial(nt64_t value) {
  if (value == 0) return 1;
  return value * factorial(value - 1);
}
```

This avoids the need for magic numbers and comments by utilizing functions instead. Unlike comments, which may not reflect the current code, functions consistently produce the intended results.

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

- Labels cannot be used in Neo-C

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
  - match, case, default, fall
  - break, continue
- import, export
- return
- class, init, struct, union, this
- interface
- enum
- requirement
- pointer
- try, catch, throw
- unique, shared
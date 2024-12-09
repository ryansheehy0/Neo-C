# Neo-C
Neo-C is a programming language that tries to solve all of my problems with C++.

It transpiles to C++, so it can be just as efficient and work on all the same platforms.

- **Transpiler**:
  - Still in development
- **Syntax Highlighting in VS Code**:
  - Copy and paste `Neo_C_Syntax_Highlighter` folder in `~/.vscode/extensions/`

<img src="./neo_c_logo.svg" width=400>

<!-- TOC -->

- [Basic syntax](#basic-syntax)
	- [Enforced naming conventions](#enforced-naming-conventions)
- [Data Types](#data-types)
- [Main function](#main-function)
- [Match statements](#match-statements)
- [Importing and Exporting](#importing-and-exporting)
- [Automatic hoisting](#automatic-hoisting)
- [For each loops](#for-each-loops)
- [Containers](#containers)
- [Enums](#enums)
- [Nested Comments](#nested-comments)
- [Do while loops](#do-while-loops)
- [Breaking out of nested loops](#breaking-out-of-nested-loops)
- [String Templates](#string-templates)
- [Templates](#templates)
- [Casting/Converting](#castingconverting)
- [Error handling](#error-handling)
- [Heap memory](#heap-memory)
- [Optimization keywords](#optimization-keywords)
- [Other changes](#other-changes)
	- [Removing gotos](#removing-gotos)
- [All Keywords](#all-keywords)

<!-- /TOC -->

## [Basic syntax](#neo-c)
- No semicolons
- Curly brackets replaced by new lines and indentations
  - Tabs and 2 spaces can be used for indentation
  - Functions and methods cannot be one one line. Neo-C is designed to work with code folding. If things look too cluttered, then fold code.

### [Enforced naming conventions](#neo-c)

| Category                                                                  | Naming convention |
|---------------------------------------------------------------------------|-------------------|
| Variables, Functions                                                      | camelCase         |
| Constants, Enum values                                                    | kConsts           |
| Classes, Structs, Unions, Enums, Interfaces, Template types, Requirements | PascalCase        |

## [Data Types](./data_type.md)

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
  String_ args[arg_c];
  for (int i = 0; i < arg_c; i++) {
    args[i] = arg_v[i];
  }
}
```

## [Match statements](./match_statements.md)

## [Importing and Exporting](#neo-c)
In C++, header files have some problems:
1. If you make a change to a definition in a cpp file, you have to make the same corresponding change in the header file.
2. When you include a header file, you are including everything in that file instead of only what you want to use.
3. When you use some code from an included header file, it isn't clear which header file that code comes from.

In Neo-C, there are no header files.

```C++
import
  libName <Library> // Imports all exported things form Library under the object libName
  fileName "./file" // Assumed to be .nc
  (var, func) <Lib> // Imports only var and func from the OtherLib
  name, (var2, func2) <Lib2> // Imports all exported things from Lib2 under the object name and imports var2 and func2.

export i64 var = 0
export void func()
  // Function body
```

See the [standard libraries](./standard_libraries.md) built into Neo-C.

- Namespaces have been removed from Neo-C.

## [Automatic hoisting](#neo-c)
Neo-C allows for automatic function, class, struct, and union hoisting so that you can use them above where they are defined.

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
i64[] arr = [1, 2, 3, 4]

for (i64 el in arr)
  // or
for (i64 el, i64 i in arr)

// C++
Array_<int64_t> arr({1, 2, 3, 4});

for (int64_t el : arr) {}
  // or
for (int64_t i = 0; i < arr.size(); i++) {
  int64_t el = arr[i];
}
```

## [Containers](./containers.md)

## [Enums](#neo-c)
There are 2 main problems with the regular enums that enum classes were designed to solve in C++:
1. Naming conflicts - You cannot reuse the names defined in the enum.
1. Implicit int conversion - Enums can be compared to or assigned to integers, which can lead to invalid values.

Because of these problems, Neo-C doesn't have a regular enums like in C++. Enums in Neo-C behave very similarly to enum classes in C++.
- You always have to specify the underlying integer type of the enum.

```C++
// Neo-C
enum i64 DayOfTheWeek
  kMon = 1, kTue, kWed, kThu, kFri, kSat, kSun
DayOfTheWeek day = DayOfTheWeek.kMon

// C++
enum class DayOfTheWeek : int64_t {
  kMon = 1, kTue, kWed, kThu, kFri, kSat, kSun
};
DayOfTheWeek day = DayOfTheWeek::kMon;
```

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
do while (false)
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
for (auto el in arr)
  for (auto el2 in arr2)
    for (auto el3 in arr3)
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

## [Templates](./templates.md)

## [Casting/Converting](./casting_converting.md)

## [Error handling](./error_handling.md)

## [Heap memory](./heap_memory.md)

## [Optimization keywords](./optimization_keywords.md)

## [Other changes](#neo-c)
- `**` can be used for exponents.
- `->` can be used just like in C++
- You have to put `const` before the data type. Ex: `const i64 var` and not `i64 const var`
- String literals are converted to a string and not a character array.

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


- cache, inline, compile
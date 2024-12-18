# Neo-C
Neo-C is a programming language that tries to solve all of my problems with C++.

It transpiles to C++, so it can be just as efficient and work on all the same platforms.
- It isn't designed to be backwards compatible with C++ or C++ libraries.

```C++
// Hello World!
import
	(print) <Console>

void main()
	print("Hello World!")
```

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
- [Multiple return types from functions](#multiple-return-types-from-functions)
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

## Basic syntax
- No semicolons
- Curly brackets are replaced by new lines and tab indentation
	- Extra spaces are ignored by the transpiler, allowing spaces to be used for aligning elements across multiple lines where the transpiler expects them to be on a single line.

### Enforced naming conventions

| Category                                                                  | Naming convention |
|---------------------------------------------------------------------------|-------------------|
| Variables, Functions                                                      | camelCase         |
| Constants, Enum values                                                    | kConsts           |
| Classes, Structs, Unions, Enums, Interfaces, Template types, Requirements | PascalCase        |

## [Data Types](./data_type.md)

## Main function
The main function returns `void` instead of `i32` because it's common to not return anything from main. Having a special exception for main, like in C++, could be confusing for new programmers.
- If you want to exit with an error code, then use the inbuilt function `exit(i32 errorCode)`.

```C++
// Neo-C
void main()
	// or
void main(string[] args)

// C++
int main()
	// or
int main(int NeoC_argc, char* NeoC_args[]) {
	NeoC_Array<NeoC_String> args(NeoC_argc);
	for (int i = 0; i < NeoC_argc; i++) {
		args[i] = NeoC_args[i];
	}
}
```

## [Match statements](./match_statements.md)

## Importing and Exporting
In C++, header files have some problems:
1. If you make a change to a definition in a cpp file, you have to make the same corresponding change in the header file.
2. When you include a header file, you are including everything in that file instead of only what you want to use.
3. When you use some code from an included header file, it isn't clear which header file that code comes from.

In Neo-C, there are no header files.

```C++
import
	libName <Library> // Imports all exported things form Library under the object libName
	fileName "./file.nc"
	(var, func) <Lib> // Imports only var and func from the OtherLib
	name, (var2, func2) <Lib2> // Imports all exported things from Lib2 under the object name and imports var2 and func2.

export i64 var = 0
export void func()
	// Function body
```

See the [standard libraries](./Standard_Libraries/standard_libraries.md) built into Neo-C.

- Namespaces have been removed from Neo-C because there isn;t the problem of overlapping names.

## Automatic hoisting
Neo-C allows for automatic function, class, struct, and union hoisting so that you can use them above where they are defined.

```C++
// Neo-C
void main()
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

## For each loops
In C++, it's impossible to include the index in a for each loop. In Neo-C, for each loops can include the index.

```C++
// Neo-C
i64[] arr = [1, 2, 3, 4]

for (i64 el in arr)
	// or
for (i64 el, i64 i in arr)

// C++
NeoC_Array<int64_t> arr({1, 2, 3, 4});

for (int64_t el : arr) {}
	// or
for (int64_t i = 0; i < arr.size(); i++) {
	int64_t el = arr[i];
}
```

## Multiple return types from functions
In C++, it isn't always clear which arguments are being used as outputs. To solve this, Neo-C introduces the `out` keyword, along with some additional rules so that it's clear which arguments are being used as an output.
- Rule 1: Any arguments that have `out` must be non-const and pass by reference/pointer.
- Rule 2: Any argument that don't have `out` must be const or pass by value.
- Rule 3: When calling a function with an `out` keyword on one of its arguments, that argument also needs an `out` keyword.

```C++
// Neo-C
void addAndSquare(out i64& add, out i64& square, i32 a, i32 b)
	add = a + b
	square = add * add

i64 add
i64 square
addAndSquare(out add, out square, 10, 10)

// C++
void addAndSquare(i64& add, i64& square, i32 a, i32 b) {
	add = a + b;
	square = add * add;
}

i64 add;
i64 square;
addAndSquare(add, square, 10, 10);
```

## [Containers](./containers.md)

## Enums
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

## Nested Comments
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

## Do while loops
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

## Breaking out of nested loops
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

## String Templates
Neo-C adds the ability to insert code into strings and to have multi-line strings.
- When doing multi-line strings, all characters have to be indented the same as the starting `"`.
	- It doesn't compile if it isn't aligned.
- The indentation has to start with the same number of tabs as the line above and then use spaces for alignment.
	- This allows the code to stay aligned even when someone changes the default tab size.
	- This rule also applies to other single line statements converted into multi-line ones. Such as multi-line `init`s, function arguments, etc.
- `\`s can be placed at the end of multi-line strings to prevent a new line.

```C++
// Neo-C
if (true)
	i64 a = 10
	string b = "10"
	string str = "x: ${x} \
	              y: ${y}"
/*
-- tabs
	-------------- spaces
*/

// C++
if (true) {
	int64_t x = 10;
	NeoC_String y = "10";
	NeoC_String str = "x: " + to_string(x) +
	                  "y: " + y;
}
```

- `\${}` allows you to escape.

## [Templates](./templates.md)

## [Casting/Converting](./casting_converting.md)

## [Error handling](./error_handling.md)

## [Heap memory](./heap_memory.md)

## [Optimization keywords](./optimization_keywords.md)

## Other changes
- `**` can be used for exponents.
- `->` can be used to dereference just like in C++
- You have to put `const` before the data type. Ex: `const i64 var` and not `i64 const var`
- String literals are converted to a string and not a const character array/pointer.

### Removing gotos
`goto`s, and likewise labels, are removed from Neo-C because they can create very confusing code. However, there are some legitimate use cases for `goto`s, but these have been addressed with Neo-C other features.
1. Breaking out of nested loops
	- This has been replaced with `break break` etc.
2. Breaking out of a loop from a switch statement that is in that loop.
	- This has been replaced by allowing `break`s to work in match statements.
3. Error handling in a scalable way
	- This is address with Neo-C error handling features.

## All Keywords
Neo-C simplifies C++ by removing many unnecessary keywords and features. Any keyword not listed here is not part of Neo-C.

- main, exit
- bool, i8, i16, i32, i64, u8, char, u16, u32, u64, f32, f64, string, dynamic
- auto, null, void
- const, true, false
- if, else, for, in, do, while, match, case, fall, break, continue
- import, export
- out, return
- struct, union, class, public, private, protected, this, This, init, inherits, pure, virtual, override, operator
- enum
- try, catch, throw, throws
- cache, inline, compile
- template

- unique, shared
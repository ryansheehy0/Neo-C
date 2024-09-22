# Experimental Neo-C
Experimental Neo-C is a version of Neo-C that has an extremely minimal syntax and is specifically designed to be easily converted into C++.

<!-- TOC -->

- [Basic Syntax](#basic-syntax)
	- [Naming Conventions](#naming-conventions)
- [Data Types](#data-types)
- [Built in functions](#built-in-functions)
- [Translations](#translations)
- [Problems](#problems)
- [All Keywords](#all-keywords)
- [Basic syntax](#basic-syntax)
- [Naming](#naming)
- [Built in types](#built-in-types)

<!-- /TOC -->

## [Basic Syntax](#experimental-neo-c)
- No semi-colons.
- No curly brackets. Tabs instead.
- No parentheses for conditions, but parentheses without space for Functions, Interfaces, Classes, Stucts, and Unions.

### [Naming Conventions](#experimental-neo-c)
- Variables, Functions
	- camelCase
- Constants
	- SCREAMING_CASE
- Interfaces, Classes, Structs, Unions, Enums
	- PascalCase

## [Data Types](#experimental-neo-c)
- `auto`
- `bool`
- `i8`, `i16`, `i32`, `i64`
	- C++: `int8_t`, `int16_t`, `int32_t`, `int64_t`
- `u8`, `u16`, `u32`, `u64`
	- C++: `uint8_t`, `uint16_t`, `uint32_t`, `uint64_t`
- type[size] name
	- C++: `type name[size];`
- type[dynamic] name
	- C++: `std::vector<type> name;`

## [Built in functions](#experimental-neo-c)
- `int64 sizeof<auto Type>(Type val)` gets the number of bytes.
- `u8[] typeof<auto Type>(Type val)` returns a string with the name of the type.

```C++
// Neo-C
i64 main()
	// or
i64 main(u8[][])
```

## Translations
- true: 1
- false: 0
- char: u8
- string: u8[dynamic]

## Problems
- Stack vs heap
	- RAII. It should be the same for the user's perspective.
- Types vs arrays

How do we solve this?

- Have 2 types of data types. Heap and stack types.
	- Including a heap and stack array.
	- Heap types have to have a corresponding stack pointer.
	- `#` means the heap
- Arrays have to have a corresponding size variable.
	- This can be accessed with .size

- `auto`
- `bool`, `#bool`
- `

```C++
// Neo-C
#i64 mem = 10;
mem = 100;

// C++
Heap_<int64_t> mem = Heap_(10);
mem.data_ = 100;
```

```C++
// Neo-C
i64[10] arr
i64[] arr2 = {1, 2, 3, 4}

// C++
Array_<int64_t> arr = Array_(10);
Array_<int64_t> arr2 = Array_({1, 2, 3, 4});
```

```C++
// Neo-C
i64[dynamic] dArr
i64[dynamic] dArr2 = {1, 2, 3, 4}

// C++
DynamicArray_<int64_t> dArr = DynamicArray_();
DynamicArray_<int64_t> dArr2 = DynamicArray_((1, 2, 3, 4));
```



## [All Keywords](#experimental-neo-c)
- auto, void, main
- bool, i8, i16, i32, i64, u8, u16, u32, u64
- const, true, false
- Control flow
  - if, else
  - for, in
  - do, while
  - match, case, default
  - break, continue
- import, export
- return
- interface, class, struct, union, this
- enum
- try, catch, throw
- compile, copy&paste



- No string, dynamic arrays
	- No string or array methods
- No char
- No object
- No Heap
- Change syntax of for each loops

- "s return u8[]

- There should be a variable called lineNum which can be put in errors to output the line number.
	- OutOfRange(")
	- No. It should just be included in the compiler.

- It should be i64 main
	- It just gets concatinatated to int.

## Basic syntax
- No semi-colons
- No curly brackets. Tabs instead.
- 

## Naming 

## Built in types

```C++
// Neo-C

// C++
```


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
	- [Objects](#objects)
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


```C++
import {OutOfRange} <Error>

template <auto Type>
export class Array(i64 size)
	Type[size] data;

	i64 at(i64 index) : OutOfRange
		if index > size throw OutOfRange("Index )
		if index > 0



```

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

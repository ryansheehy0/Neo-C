# Neo-C Ground Up
Trying to make the perfect programming language.
Compiles into C++.
- Have a whitespace token and a new line token


## Built in data types
- auto
- bool
- i8/char, i16, i32, i64
- u8, u16, u32, u64
- f32, f64
- Arrays
	- type[size]
	- string
	- type[dynamic]
	- Built in array functions

### Containers
- struct
	- c style structs
- enum
	- Same as an enum class
- class
	- no inheritance
	- different syntax
- interface
	- Maybe?

## Built in libraries
- Terminal
	- print()
	- userInput()
	- printError()
- Math
- File
- Error
	- exit()
- Regex
- Algorithms
- Conversions

### Conversions
- toArr()
- toStr(value)
	- The value is put in between each element.
- toI8(), to
- toU8()
- 

## Importing and Exporting
- You can import libraries with `<>`s
- You can import files with `""`s
- import Name "./filePath.nc"
	- You can just make up the Name
- import Math <Math>
	- Math.abs()
- import Math, {abs, sqrt} <Math>
	- abs()
- import {abs, sqrt} <Math>
- export void func()

## Built in conditionals
- if, else if, else
- match
- while, do while
- for
	- for u32 i = 0; i < str.size(); i++
	- for u32 el in str
	- for u32 el, u32 i in str

## Other
- Automatic function hoisting
- u64 main(string[dynamic] args)
	- args.size()
	- Dynamic array arguments are stored on the heap.
- try catch blocks
- pointers, address, and reference variables
- No operator overloading
- Nested comments
- `**` can be used for exponents
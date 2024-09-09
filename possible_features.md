## Todo
- std::array vs C-style arrays
	- The size of std::array can't be defined at run time
	- C-style arrays are missing a lot of features
- interfaces
- templates
	- Remove template meta programming
- new and delete
	- Allows easy creation of objects on the heap instead of the stack.
- static
- volatile
	- So compiler doesn't optimize things out
- async, await, and promises
- multi threading
- casting
	- I like the syntax of C-style casting.
	- What about const_cast? How to cast consts
- typeof
- functions within functions?
	- You cannot have a class within a class.
- Inline functions
	- Maybe don't include. Could be confusing.
	- if included, should they be allowed to have curly brackets
- Assigning functions to variables
	- Maybe don't include. Could be confusing.
	- When you create a function you should be able to use it like a variable.
- How to do functions as arguments
- Creating libraries
	- Should be done through the compiler.
	- Should have 2 settings. Include links or not.
- asm keyword?
- enums
	- Make all enums, enum classes? Probably. Makes code more readable.
- Smart pointers
- `co_await`, `co_return`, `co_yield`?
- `constexpr`, `consteval`, `constinit`

## Other notes/ideas
- In C++, I should make variable names have _ in the middle of them so they don't conflict with any of the user defined variables.
- All constructors are given the `explicit` keyword to prevent confusing implicit conversions.
	- There should be a common syntax for creating objects from variables.

### Change how default arguments work
Unnecessary to include
- Default arguments don't have to be in order

```C++
// Neo-C
int func(int a = 0, int b) // init
func(, b) // calling

// C++
int func(int a, int b) {} // init
func(0, b); // int
```

- You can also do C++ regular default augments

```C++
// Neo-C
int func(int a, int b = 0) // init
func(a) // calling

// C++
int func(int a, int b = 0) {} // init
func(a); // int
```

### Code formatting nazi?
Neo-C enforces a certain style to your code. This is to allow a common look and feel to Neo-C.
Probably don't have because it can make errors and new users frustrated with the language.
- Should just leave this to who-ever is using the language.

- `const` has to be in front of any data type.
	- `const auto` instead of `auto const`
- For pointers and references `*` and `&`s have to be placed in front of the name.
	- This is allowed:     `int *ptr` and `int &ref`
	- This is not allowed: `int* ptr` and `int& ref`
- Function arguments, arrays, and anything that using a comma to separate it must have a space after the comma.
	- `int arr[] = {1, 2, 3}` and not `int arr[] = { 1,2,3 }`
- Spaces are required before any `()`s, but functions and classes cannot have spaces after it.
	- `if ()`, `for ()`, `while ()`, etc.
	- `void func(int arg)`, `func(arg)`, `class Class(int arg)`, etc.
- It is recommended to use camelCase for vars and funcs, and PascalCase for classes and enums.
	- This is not enforced to allow you to keep consistency with other code in C/C++.
- Naming conventions
	- When creating functions or variables you have to use camelCase.
		- `int thisIsAVar`, `int thisIsAFunc()`
	- When creating classes, enums you have to use PascalCase.
		- `class ThisIsAClass()`
	- Enforcement is applied only when creating things, not when using them, to ensure compatibility with other people's C++ code.
	- Maybe not because people then can't swtich Neo-C if their libraries use snake case

### Better if statements
It's annoying to have to write the variable name again. If nothing is provided to the left of the comparator, then it's assumed to be the same as the other left of the comparator.

```C++
// Neo-C
if a > 10 && < 20
	// Or you can do
if a > 10 && _ < 20

// C++
if (a > 10 && a < 20)
```

```javascript
let a = `Test ${Test} test`
```
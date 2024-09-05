## Probable Possibly included features
- You can have functions within functions.
	- Can you have classes within classes? No. Don't do this. It could be confusing.
- There is no `static` keyword for member variables and functions?
	- No static in classes? You can only do so through functions.
- Your `try` can be on the same line as you code

```C++
// Neo-C
try func()
catch (int error)
	// Handle error

// C++
try {
	func()
} catch (int error) {
	// Handle error
}
```

- Remove operator overloading
	- It can easily be misused
	- It confuses people, they don't know if something is done through a library or in built into the language.

## Low probably
- All `enum`s become `enum class`es.
	- Maybe not. It's nice just using the variables.
- Inline functions should still be allowed to use curly brackets?
- No operator overloading.
	- This can create really confusing code. Confuses what's built into the language and what comes from a library.
	- What could this possibly take away from the language?
- Default arguments don't have to be in order
  - Why do this?

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
- If it's already not backwards compatible with C, why have the features of C?
	- Remove C style arrays? Should be std::array instead.
	- Change the default to std::string instead of const char*
		- Or just have an auto conversions

## Working on it
- Objects in c++ without a class?
	- Special syntax for automatically creating an unordered_map?
- Using ranges(`...`) for strings in match statements
	- "a"..."abc"
		- "a", "b", "c", ... "z", "aa", "ab", ..., "ba", "bb" ... "abc"
		- Or "a", "ab", "abc"

## Probably not
- Async await
	- There is probably a library for this
- ... for file paths(Probably not)
	- Recursively search. Good idea.
	- YourProjectFolder/.../file.h
	- Allows you to change things around in your project without going in an changing the file paths.
		- This makes compile time longer though because it has to recursively search
		- This also forces you to not have duplicate file names in your project.
	- Why not have the feature of when you move a file, it searches through all your code and updates the file path.
		- That would be better.
		- Just an extension and doesn't have to be built into the language.
- `x := 0` instead of `auto x = 0`
	- This could just be more confusing
- Maybe only guarantee use of the standard libraries.
	- This could be bad. It removes a lot of functionality from Neo-C
	- Remove inheritance
	- Remove C backwards compatibility
- All constructors are given the `explicit` keyword to prevent confusing implicit conversions. This cannot be changed in Neo-C.
	- What are all the use cases for implicit conversions?
	- Implicit conversion can be useful to create user defined types.
- The spread operator from JS? No need.
- 

## Bloat
C++ includes many nice features over C, but it also includes a lot of bloat.

- `mutable`
	- `const` after a member function doesn't allow you to change any internal variables in the class.
	- `mutable` on a variable allows any of these function to change that variable and still be const.
- `delete`
- Remove `enum class`. Use namespaces and enums.
	- You can achieve the same result by putting an enum inside a namespace.
	- If you want to make something of the enum type you can't do so with enum in a namespace
- Casting?
	- `const_cast`, `static_cast`, `reinterpret_cast`, `dynamic_cast`
	- Why not use C style casting?
- Constants?
	- `constexpr`, `consteval`, `constinit`
	- When could this be useful?
- `protected`
	- Used for inheritance. Allows child classes to use member variables, but not objects themselves.
	- Would have to remove inheritance, so maybe not.
- `co_await`, `co_return`, `co_yield`?
- `export`?
	- Could that be used for global state?
- `register`
	- it does nothing
- Remove template meta programming

## Code formatting nazi?
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

## [Inheritance](#neo-c)
- I think inheritance is fine, just the way it should be used is important.(You can misuse all sorts of syntax things in any language.)
	- Neo-C does not support inheritance because it can create confusing code. Instead of a child class inheriting a parent class, inheritance, you should include an instance of the parent class in the child class, composition.
  - https://www.youtube.com/watch?v=hxGOiiR9ZKg
  - `protected` keyword cannot be used in Neo-C
	- How would you use libraries who rely on inheritance? Not standard libraries.

- Add the `interface` keyword.
	- A class that only has virtual functions with = 0;
- You can only use inheritance on interfaces.

## [Auto using](#neo-c)
- Do this only for std libraries?
	- Probably not.
It C++
- When you include standard libraries `using std::library` is automatically added.
	- This is only the case for standard libraries
	- What about `<iostream>`
		- It should only automatically use the functions used.
		- Autodetect this? What if you want to create a function that has the same name as like `cout`?
	- You also don't know what function is coming from what file.
		- I like how in js you have to specify what you want to include form the exported variables file.

		- `#include std::cout <iostream>` is

```C++
// Neo-C
#include (std::cout, cerr) <iostream>

// C++
#include <iostream>
using std::cout, cerr;
```

In C++ if you use something from a libary, it isn't clear which library it came from. You have to look into each header file in order to determin. In Neo-C there is special syntax which allows you to chose what you want to include form header files and whcih header file they are being used from.
- Is there a way to get importing and exporting like in front end javascript frameworks?

## [Importing and exporting](#neo-c)
- `import` and `export` keywords are added.
	- `import (std::cout) <iostream>` allows you to only include the std::cout function and none of the others.
		- Is this really necessary? Probably not.

```C++
// Neo-C
import (std::cout) <iostream>

// C++
#include <iostream>
using std::cout;
```

- But I like the way javascript handles importing and exporting.

## Syntax highlighting
- Implement syntax highlighting for Neo-C
	- https://www.youtube.com/watch?v=5msZv-nKebI&list=WL

## Problems
- How to tokenize?
	- Handle spaces? How do I enforce spaces?
	- How to handle all the different types f tokenization in C++?
- How to parse more complicated code?
- How to organize the code?

## Better if statements
It's annoying to have to write the variable name again. If nothing is provided to the left of the comparator, then it's assumed to be the same as the other left of the comparator.

```C++
int a = 10;
if (a > 10 && a < 20)

// Neo-c
if a > 10 && a < 20
if a > 10 && < 20 // This should work
```
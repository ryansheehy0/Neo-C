## Probable Possibly included features

## Low probably
- Inline functions should still be allowed to use curly brackets?
- No operator overloading.
	- This can create really confusing code. Confuses what's built into the language and what comes from a library.
	- What could this possibly take away from the language?

## Working on it
- Negative array indexing
	- In C++ there is no way to easily get an element starting from the last index. Therefore Neo-C adds additional syntax for this purpose.
	- Need to allow for array indexing the the left

```C++
// Neo-C
int lastElement = vec-[-1]
int secondToLastElement = vec-[-2]
int thirdToLastElement = vec-[-3]

// C++
int lastElement = vec[vec.size() - 1];
int secondToLastElement = vec[vec.size() - 2];
int thirdToLastElement = vec[vec.size() - 3];
```
- The problem with this is that there is no consistent way to get the size of the element. The compiler has to get the size of the element.
	- `sizeof(arr) / sizeof(arr[0])`
	- `vec.size()`
- Objects in c++ without a class?
- Removing const after ()s for a function. This means it promises not to modify anything inside the object.

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
- Bloat
	- C++ includes many nice features over C, but it also includes a lot of bloat.
	- delete keyword
	- Remove enum classes. Use namespaces and enums.
		- You can achieve the same result by putting an enum inside a namespace.

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
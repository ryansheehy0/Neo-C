## Probable Possibly included features
- What about PASCAL_CASE for constants? That isn't allowed? Maybe instead of the `const` keyword you just make the variables in PASCAL_CASE in order to define them as constants. Can variables change from non constants to constants?
- You can have functions within functions.
	- Can you have classes within classes? No. Don't do this. It could be confusing.
	- Assigning functions to variables?
- How do you create a custom library?

## Low probably
- All `enum`s become `enum class`es.
	- Maybe not. It's nice just using the variables.
- Inline functions should still be allowed to use curly brackets?
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

- Async await in Neo-C

## Probably not
- All constructors are given the `explicit` keyword to prevent confusing implicit conversions. This cannot be changed in Neo-C.
	- What are all the use cases for implicit conversions?
	- Implicit conversion can be useful to create user defined types.

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

## Better if statements
It's annoying to have to write the variable name again. If nothing is provided to the left of the comparator, then it's assumed to be the same as the other left of the comparator.

```C++
// Neo-c
if a > 10 && < 20
	// Or you can do
if a > 10 && _ < 20

// C++
if (a > 10 && a < 20)
```

```javascript
let a = `Test ${Test} test`
```

## Syntax highlighting todo
- Single line and multi line Comments
- Nested comments
- Single quotes. ''
	- '[^']{1}'

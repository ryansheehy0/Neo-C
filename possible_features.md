## Todo
- casting
	- I like the syntax of C-style casting.
	- What about const_cast? How to cast consts

- templates
	- Remove template meta programming
- new and delete
	- Allows easy creation of objects on the heap instead of the stack.
- static
- volatile
	- So compiler doesn't optimize things out
- async, await, and promises
- multi threading
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
- Use the `?` to wrap things in `std::optional`
- Macros

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
Probably don't include these. These aren't that big a deal.
- For pointers and references `*` and `&`s have to be placed in front of the name.
	- This is allowed:     `int *ptr` and `int &ref`
	- This is not allowed: `int* ptr` and `int& ref`
- Function arguments, arrays, and anything that using a comma to separate it must have a space after the comma.
	- `int arr[] = {1, 2, 3}` and not `int arr[] = { 1,2,3 }`

### Better if statements
It's annoying to have to write the variable name again. If nothing is provided to the left of the comparator, then it's assumed to be the same as the other left of the comparator.
`_` uses the last used variable in a conditional

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
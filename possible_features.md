## Todo
- There is no implied conversion with instances of classes so that the syntax for creating an object from a class is consistent.
	- The `explicit` keyword is used on all constructors.
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
- Better error handling than try catch
	- Problem with try, catch: You don't know what error can be thrown.
		- If you force the parent function to return the errors, then you have to check for errors for each function.
		- If you throw an exception in the function you have to specify its type.
			- Any parent function which implements a child function has to also specify the throw errors.
			- Thrown errors are automatically bubbled up until they reatch a catch.

## Other notes/ideas
- In C++, I should make variable names have _ in the middle of them so they don't conflict with any of the user defined variables.
- No implicit conversions. Only can use Convert library.
- Maybe have a special syntax that allows you to return multiple values.
	- They are automatically converted to arguments.
	- This makes sure that all arguments are only vars being used and not being returned.
	- Probably not. This diverges too much from C++.

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
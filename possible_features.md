## Notes
- The transpiled C++ should have _s in the middle of var names so they don't conflict with the Neo-C code.

## Need to research
- Other data structures
- Multi-threading
- `volatile`
- `co_await`, `co_return`, `co_yield`

## Todo
- Heap with unique and shared pointers.
- KeyValuePair standard library
- Castings
- Creating libraries through the compiler options.
	- 2 settings. Include all the code or have outside links.
- Having functions as arguments are the same as creating functions without argument names. `void print(string)`
- Inheritance hierarchy of errors
	- OverRange, UnderRange, and OutOfRange errors.

## Possible features
- `!` for errors.
- `?` for optionals.
	- This is useful for optional arguments.
- Differently named constructors.
- `defer` keyword - gets called when you return.
- Removing the capture list(`[]`s) from lambdas.
- `finally` block
- Call the destructor like any other method.
- `i32* ptr` and `i32& ref` over `i32 *ptr` and `i32 &ref`
- `_` in a condition statement refers to the last used variable.
	- `if (a > 10 && _ < 20)`
- Change default arguments
	- `void func(i64 a = 0, i64 b)` and `func(, 10)`
	- `void func(i64 a, i64 b = 0)` and `func(10,)` or `func(10)`
- Imbed asm and c++?
- Multiple arguments into templates
- Force all member variables to be private or protected?
	- Force setters and getters.
	- Have special syntax for setters and getters.
- Multi-threading with async/await
- `&&` for rvalues. Why would this be necessary?
- Passing arrays into function arguments with the spread operator(`...`)
	- `func(arr...)` or `func(...arr)` is the same as `func(arr[0], arr[1], arr[2])`
- Variadic arguments(`...`)
	- Allows for a string called args. Have to be cast to the appropriate values.
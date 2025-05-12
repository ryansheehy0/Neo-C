## Notes
- The transpiled C++ should have _s in the middle of var names so they don't conflict with the Neo-C code.

## Need to research
- Other data structures
- Multi-threading
- `volatile`
- `co_await`, `co_return`, `co_yield`
- `constexpr` - function can run at compile time if possible or else run time.
	- Variables which are constexpr are const because they can't be changed at run time.
- `consteval` - function can only run at compile time.
- `constinit` - Guarantees the value of a variable is initialized at compile time instead of run time.
	- Cannot have a constinit function. Only a variable.
	- Cannot be used in any scope. Has to be global/above main func.
- `std::is_constant_evaluated()` - returns true if the constexpr is being run at compile time, and false if being run at run time.
	- Used to have different code that runs at compile time and run time.

- Function initialization vs variable initialization

## Todo
- Heap with unique and shared pointers.
- KeyValuePair standard library
- Creating libraries through the compiler options.
	- 2 settings. Include all the code or have outside links.
- Having functions as arguments are the same as creating functions without argument names. `void print(string)`
- Inheritance hierarchy of errors
	- OverRange, UnderRange, and OutOfRange errors.

## Possible features
- Make `optional` work better for optional arguments.
	- maybe change how it works to assign the _hasValue with =s?
	- or a special keyword like `null` that sets the _hasValue to false. This might be confusing though.
	- Maybe assign optional to an empty `{}`. What does this mean in c++?
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
	- Yes to allow people to use c++ libraries.
	- Have a `C++` keyword. Or allow c++ files?
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
- `mutable` - Make something logically const, but not actually const.
	- Have a method be const, but be able to change mutable member variables.
	- Is this only useful for multithreading?
	- Not sure this is necessary.
- Don't use `delete`, but `release`
	- Will this be necessary for smart pointers?
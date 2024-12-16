## Possible features
- Have a `copy&paste` keyword and `cache` keyword.
	- `copy&paste` tells the compiler to copy and paste the value.
	- `cache` can be used to cache a function so when you call it again it doesn't have to recalculate it can just give its previous result.
- Enforce pass by reference and pass by values rules. Only allow pass by values, pass by const reference, and pass by pointer.
	- `void func(void (*func2)(int, int))` or `void func(void (const &func2)(int, int) )`
	- `void func(int (*arr)[])` or `void func(int (const &arr)[])`
	- How do you enforce this?

- Function arguments can only be const references or pointers.
	- Have a special syntax for this.
	- If you are changing, then use a pointer.
	- If you aren't changing, then use a const reference.
	- When you call a function, you know what arguments are being changed and which ones aren't.

- Variables are by default consts and you have to use `var` keyword if you want to have them modifiable.
	- Should this be the case? You might have to remove screaming case for constants.

- Maybe allow operator overloading so template classes can be made easier. Ex: overloading the > or =s so that it behaves the same as default types.
- This should be the inbuilt way to do function arguments. Function points aren't allowed.
	- `#include <functional>`
	- `function<void(int&, int&)> operation`
	- Should there be a function keyword? No. Just do.
		- `void operation(int&, int&)` which translates into `std::function<void(int&, int&)> operation`
		- You can't do function pointers.
- Remove the capture list for inline functions.
	- `(int& x, int& y){}` translates into `[&](int& x, int& y){}`
	- These can only be used inside other functions.
	- These can be assigned to variables? Yeah.
- Maybe operator overloading is good. It makes the syntax nice.
	- But it is often confusing.
- No operator overloading
	- Destructors cannot have arguments.
	- You need to operator overload the =s operator to do a deep copy(copy pointer values instead of the pointer itself).
		- The only difference between that and a copy constructor is a destructor call.
			- The destructor call has to be after the check that you're not assigning to yourself.
		- Use the `copy` keyword in front of the constructor to make it a copy constructor which also overloads the =s operator.
			- The destructor is automatically called when =s is used and not called when it
			s used as a constructor.
		- This is just overloading the =s with extra steps. Maybe just have them call a method instead of using the assignment(=) operator. The assignment operator always means a shallow copy.
		- A method cannot call it's own destructor.
- Method declarations `void func() const : ErrorType`
- `export` keyword puts the declaration in a .h file and the definitions in the .cpp files.
	- Imported file objects have to be in PascalCase. They are wrapped in namespaces that get converted from `.`s to `::`s.
	- It is recommended to use code folding so that you can easily see the signatures of the things that are exported in a file.
- `...` for the spread operator.
	- `func(...arr)` is the same as `func(arr[0], arr[1], arr[2])` for all the elements of the array.
	- Functions with a variable number of arguments?
		- Use the `...` syntax. It's treated like an array of args. Maybe it has to be `args...`. You can change the name to what you want.
		- `...` is the same as `string[] args`
			- Why not do `i32 main(...)`?
- Don't allow a function to be created in another function.
	- Inline functions?
- Don't allow a class to be defined in another class.
	- Don't allow a struct in a class
- OverRange, UnderRange, and OutOfRange errors.
- This language is designed to work with line wrap enabled. You cannot add new lines willy nilly.

- Variables in ranges for match statements?
- RAII
  - Function returning pointer to object.
  - Maybe my idea of RAII is wong.
  - Always use smart pointers.
- AWK programming language.
  - Associated arrays
- Error handling
  - Exceptions are raised when there's programming error.
    - Return exception when file doesn't exist.
  - Top level handles what can throw an error.
    - Top level opens file and passes it to the leaf functions.
- Inheritance
  - Right tool for the right job.
  - UI frameworks for inheritance.
  - Don't want to implement your library with a sub class.

- Variadic arguments(`...`)
	- Allows for a string called args. Have to be cast to the appropriate values.
- Functions as arguments.

- Minor syntax enforcements
	- You cannot have containers in other containers.
		- Ex: You can't have a struct defined in a class.
	- You cannot have functions in other functions.
	- There is no inline function in Neo-C.
	- No assigning functions to variables. You can with a pointer?

	- How to do functions as arguments. Lamda arguments.
	- Maybe no reference arguments and instead just use pointers.
		- Less confusing syntax. Probably not.
	- Maybe only allow single inheritance? But then I need all of those inheritance keywords.

## [Compile time operations](#neo-c)
This can be automatically done by the compile?
In Neo-C, you can have functions be evaluated at compile time if the arguments to those functions can also be calculated at compile time. This can be done by putting the `compile` keyword before a function call.

```C++
i32 main()
	const i64 FIVE_FACTORIAL = compile factorial(5) // This is valid
	i64 var = 6
	const i64 SIX_FACTORIAL = compile factorial(var) // This is invalid because var isn't known at compile time.

i64 factorial(i64 value)
	if value == 1 return 1
	return value * factorial(value - 1)
```

Neo-C also allows constants to be copied and pasted by the compiler. The value of the constant has to be defined at compile time. This can be done using the `copy&paste` keyword.

```C++
copy&paste const i64 PI = 3.14
```

These two keywords can be combined to allow the values of constants to be calculated at compiled time and then copied and pasted into the code.

```C++
copy&paste const i64 FIVE_FACTORIAL = compile factorial(5)
```

This maybe needed.
	- The compiler might not have enough information to know.
	- Need a keyword for compile time if statements.


## Notes
- The transpiled C++ should have _s in the middle of var names so they don't conflict with the Neo-C code.

## Need to research
- Other data structures
- Multi-threading
- `volatile`
- `co_await`, `co_return`, `co_yield`

## Todo
- `operator` keyword in containers.
- Heap with unique and shared pointers.
- Add data structure library
	- Array, String, DynamicArray, LinkedList, DoublyLinkedList
- KeyValuePair standard library
- Castings
- Creating libraries through the compiler options.
	- 2 settings. Include all the code or have outside links.

## Possible features
- `!` for errors.
- `?` for optionals.
	- This is useful for optional arguments.
- Differently named constructors.
- `defer` keyword - gets called when you return.
- Lambdas don't need `[]`s?
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
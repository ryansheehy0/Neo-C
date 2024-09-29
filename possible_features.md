## Todo
- Heap
	- `unique<type>` and `shared<type>`
	- No `new` and `delete` keywords.
	- Remove RAII explanation
- Define casting functions

## Possible features
- Functions with a variable number of arguments?
- This language is designed to work with line wrap enabled. You cannot add new lines willy nilly.

- It compiles into C++
  - Just as efficient as C++
  - Doesn't compete with C++ compilers and their 

- Variables in ranges for match statements?
- `fall through` case statements
  - Don't have case 'a'
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



- Templates
	- Multiple arguments into templates
		- typename..., sizeof..., args...
			- compile time if. if constexpr
	- Possible keywords
		- `where`, `concept`, `requires`
	- Sources
		- https://www.youtube.com/watch?v=HqsEHG0QJXU

Returns true if the body can support those lines.

```C++
void printValue<HasMultiple Type>(Type value)
	print(value)

requirement HasMathOperators<auto Type>(Type a, Type b)
	a ** b
	a * b
	a / b
	a + b
	a - b

requirement IsArray<auto Type>(Type a)
	a[0]

requirement HasAddition<auto Type>(Type a, Type b)
	a + b

requirement HasLessThan<auto Type>(Type a, Type b)
	a < b

requirement HasMultiple<HasAddition && HasLessThan Type>(Type value)
	value

requirement IsI8(i8 value)
	value

requirement IsI16(i16 value)
	value

requirement IsI32(i32 value)
	value

requirement IsI64(i64 value)
	value

requirement IsInt<IsI8 || IsI16 || IsI32 || IsI64 Type>(Type value)
	value
```

- Minor syntax enforcements
	- && for rvalues should not be used?
		- temp values
	- You cannot have containers in other containers.
		- Ex: You can't have a struct defined in a class.
	- You cannot have functions in other functions.
	- There is no inline function in Neo-C.
	- No assigning functions to variables. You can with a pointer?

- Keywords
	- static
	- volatile
		- So compiler doesn't optimize things out
	- asm keyword?
		- c++ keyword?
	- `co_await`, `co_return`, `co_yield`?

- Built into the lang
	- Use the `?` to wrap things in `std::optional`
		- Don't use optionals for error handling.
	- Key value pairs built into the language?
		- Map
		- `dictionary`, `keyValuePair`, `key`
		- map<KeyType, ValueType>
		- orderedMap

- Libraries
	- All the types of errors
		- OutOfRange

- Other
	- How to do functions as arguments. Lamda arguments.
	- multi threading
		- async, await, and promises
		- Built into the language
	- Creating libraries
		- Should be done through the compiler.
		- Should have 2 settings. Include links or not.
	- Maybe no reference arguments and instead just use pointers.
		- Less confusing syntax. Probably not.
	- Maybe only allow single inheritance? But then I need all of those inheritance keywords.

	- Heap
		- Built in functions: `move`, `get`, `reset`, `release`, `count`, `swap`, `lock`, `expired`
			- Maybe make all of these methods.
		- Weak pointers

```C++
unique<i64> i = 10
i.get()
```

## Most likely not
- Function like macros
	- Need a whole new syntax for them to work. This is where metaprogramming is.
	- It can get very confusing.
- Maybe have a special syntax that allows you to return multiple values.
	- They are automatically converted to arguments.
	- This makes sure that all arguments are only vars being used and not being returned.
	- Probably not. This diverges too much from C++.
- functions within functions?
	- You cannot have a class within a class.
- Inline functions
	- Maybe don't include. Could be confusing.
	- if included, should they be allowed to have curly brackets
- Assigning functions to variables
	- Maybe don't include. Could be confusing.
	- When you create a function you should be able to use it like a variable.
- Function like macros
	- This can be done with templates

## Other notes/ideas
- In C++, I should make variable names have _ in the middle of them so they don't conflict with any of the user defined variables.

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

## Templates
- https://www.youtube.com/watch?v=sjsnuirLyKM
	- use interfaces to define Types?
	- auto as a function argument and return types.


### [Objects](#neo-c)
Probably don't include. It doesn't really solve a problem.

- Neo-C doesn't allow constructors to be private.

Objects in Neo-C are like singletons. There's only ever one instance of them.

```C++
// Neo-C
object obj
  string _privateVar
  string publicVar = "Example"

  void publicFunction()

// Accessing the object
obj.publicFunction()
obj.publicVar

// C++
class obj {
  public:
    static obj& get_object() {
      return object_instance;
    }

    void publicFunction(){
    }

    std::string publicVar = "Example";

  private:
    obj() {}
    static obj object_instance;

    std::string _privateVar;
}

// Accessing the object
obj.get_object().publicFunction();
obj.get_object().publicVar;
```

## Need to implement classes
- String_
- Array_
- DynamicArray_
- Heap_

## Remove namespaces
- In C++, when you `#include` the compiler simply copies and pastes that file at that location. This could be a problem if different files have the same element names.
In C++, one of the primary purposes fo namespace is to fix some of the problems that happens with `#include`. In C++
In C++, namespaces are mainly a result of how C++ does its importing. In C++, when you `#include` a file, the contents of that file get copied and pasted at that location. If you are including multiple files and there's a naming conflict between the files, then that would cause a problem. Namespaces 
Neo-C doesn't have 

- Explain why namespaces have been removes
- Librayr names should be camelCase bcause they are objects
- remove namespaces form ## Enums

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
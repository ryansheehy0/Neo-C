## Todo
- Heap
	- `unique<type>` and `shared<type>`
	- No `new` and `delete` keywords.
	- Remove RAII explanation
- Define casting functions
	- Why not just use c++ casting? It doesn't throw errors.
		- Why not check for errors and then use c++ casting?
			- Could I actually write a better conversion algorithm? Probably not.
- Force there to be setter and getter methods. No public variables.
	- Why? Later when you realize your setters need to do more that just set the value, you'll have to change everywhere that property has been used directly.
	- Interfaces can only have methods
	- Special syntax like with c#
	- Any public variables are given two functions with the name of the variable. Ex: `i64 x` has the methods `i64 x() const` to get and `void x(i64 input)`. What if you don't want those to be public? Then make it private and define your own methods. Is there another way?

- Organize possible features
- Converting/Casting
- Learn smart points and finish heap
- Special getters and setters syntax?
- The big 3? How to do without operator overloading?
- Double check
	- std::string was replaced by String_
	- Syntax highlighting on github
- Multi-threading with async/await
- Math library
- Translate examples into C++
- Implement different classes in C++
- Doubly linked list example
	- Just contains a head pointer
	- Have a node class
- LeetCode in Neo-C and C++
- HolyC

## Possible features
- It is recommended to use code folding so that you can easily see the signatures of the things that are exported in a file.

- When you assign an object to another object and it's already initialized, in order to do a deep copy, you need to overload the = operator.
	- Ex: `obj2 = obj1`

```C++
MyClass& MyClass::operator=(const MyClass& rhs) {
	if (this != &rhs) { // Don't self assign
		delete num; // Free old memory
		num = new int; // Create new memory
		*num = *(rhs.num); // Assign new memory
	}
	return *this;
}
```
	- How to do without operator overloading? Maybe combine with constructor copying(probably not, they do different things)?
	- Maybe have special syntax for the rule of three. You have to define all of them if you use heap memory in a class.

- No operator overloading
	- I like having a very clear distinction between what's in the language and what's made by a user.

- Interfaces
	- There should be the overriding keyboard for Interfaces.
	- Should not allow interfaces to have variables. Only methods.
	- Force the user to use the `override` so that it's clear they are overloading something from an interface.

- `void func() const : ErrorType;`

- header files are nice because you can easily see the methods and variables you can use.
	- Problems with header files:
		- Namespaces
		- Don't know what methods come from which file.
		- Private variables in header files
		- Having to go back and forth between .h and .cpp when you change a method header.
		- Allow only the changed files to be compiled.
			- If the exports are in their own header file, then this isn't a problem.

- `...` for the spread operator.
	- `func(...arr)` is the same as `func(arr[0], arr[1], arr[2])` for all the elements of the array.

- The `new` keyword returns a special heap pointer
	- `#i64 xPtr = new i64` or `#i64* xPtr = new i64` or `i64# xPtr = new i64`
	- If the value of the pointer is used(not dereference, but just used), then it becomes set to null.
	- Once it goes out of scope it is automatically dealocated
		- There is no `delete` keyword
	- If someone does `&(*xPtr)`, then the user can break the compiler and have memory leaks. Programmers do this only when they know exactly what they are doing.
	- New should return a special heap pointer: `i64# heapPtr = new i64`

- The `const` after a method says that no member variables are being changed.
	- `void method() const`
	- Allows you to call that method on a const object.
	- Is this necessary? Why can't the compiler automatically detect this?

- Classes don't need to call their own getters and setters for private variables.
	- Getters and setters should not be automatically enforced.

- OverRange, UnderRange, and OutOfRange.
	- How could I express that hierarchy? Maybe have something in the OutOfRange class that specifies which direction it's out of range.
- [] should not throw errors. Use .at if you want to throw an error.
- Should be allowed to create a class inside another class.
- Should be allowed to create a function inside another function.

- Functions with a variable number of arguments?
- This language is designed to work with line wrap enabled. You cannot add new lines willy nilly.

- Functions start with upper case and methods start with lower case?

- It compiles into C++
  - Just as efficient as C++
  - Doesn't compete with C++ compilers and their

- `...` is the same as `string[] args`
	- Why not do `i32 main(...)`?

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

- Variadic arguments(`...`)
	- Allows for a string called args. Have to be cast to the appropriate values.
- Functions as arguments.

```C++
// For strings
string map(char (*function)(char element, i64 index, string array))
	string outputStr = ""
	for char el, i64 i in this->_data
		outputStr += function(el, i, this->_data)
	return outputStr

string map(char (*function)(char element, i64 index))
	string outputStr = ""
	for char el, i64 i in this->_data
		outputStr += function(el, i)
	return outputStr

string map(char (*function)(char element))
	string outputStr = ""
	for char el, i64 i in this->_data
		outputStr += function(el)
	return outputStr

// -----------------------------

string test = "abc"
test = test.map(toUpper)

char toUpper(char element)
	match element
		case 'a'...'z': return element - 32
		default: return element
```

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
int func(int a, int b = 0)
func(a)
	// or
func(a,)

// C++
int func(int a, int b = 0) {}
func(a);
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

### [Things that throw errors](#neo-c)
Should these things throw errors?
- Integer division by zero throws an error.
- Integer overflowing or underflowing throws an error.
- `[]` indexing out of range.




I have noticed that if I have longer and longer conversations with your AI it starts to slow down it's time to respond. My guess is that this is because it has to re-read all of the previous conversations. Would it be possible for the AI to continually be summarizing it's past conversations with me on its backend(not visible to the user), therefore when I continue to talk with it it doesn't have to re-read everything and can instead just re-read its own summary?
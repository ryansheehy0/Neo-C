- Taking the simplicity of the syntax in other languages and applying them to c++.
	- C++ tends to be very verbose compared to other languages
- To make the difference between pseudo-code and code as minimal as possible

## Todo
- `!` are errors
- `:` are 

- The cache keyword can be used to cache a function's value for a certain set of inputs.
	- If the function is called again with the same inputs, the cached value is returned

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

## Function arguments
- Functions can only have 3 types of arguments.
	- Pass by value
	- Pass by const reference
	- And pass by pointer
- Types can have `?` after them to make them optional

```C++
// Neo-C
void func(i64 a, const i64&? y)
```

## Heap
In C++, the new keyword creates memory on the heap and returns a pointer to it. The delete keyword frees that memory. There are 3 main problems with this.
- Forgetting to delete memory causing a memory leak
- Deleting the same memory twice
- Using memory that was deleted

All of these problems would be solved if the freeing/deleting of heap memory could be handled automatically. There are two sort of approaches to do this.
1. It to keep track of all the references to the heap memory and when there are no more references to it, then free/delete it.
	- This is garbage collection in most other languages or shared pointers in c++.
	- This is nice to use, but it has some run time costs.
2. To only allow one reference to heap memory that gets passed around. If this reference goes out of scope it frees/deletes the heap memory associated with it.
	- This is unique pointers in c++.
	- It has very little run time costs, but is annoying to use.

What if you could combine the nice to use part of the first approach with the little run time costs of the second approach?

That's sort of what Neo-C does. It provides a wrapper syntax around unique pointers that make them nice to use.

```C++
// Neo-C
int# heapPtr = new int
```

- The `new` keyword returns a special heap pointer
	- `#i64 xPtr = new i64` or `#i64* xPtr = new i64` or `i64# xPtr = new i64`
	- If the value of the pointer is used(not dereference, but just used), then it becomes set to null.
	- Once it goes out of scope it is automatically dealocated
		- There is no `delete` keyword
	- If someone does `&(*xPtr)`, then the user can break the compiler and have memory leaks. Programmers do this only when they know exactly what they are doing.
	- New should return a special heap pointer: `i64# heapPtr = new i64`

## Templates
- Just change the syntax for c++ templates. Don't do anything fancy.
- Templates in Neo-C should have a 1to1 corelation to templates in c++

```C++
// Neo-C
void func<auto T>(T arg)

// C++
template<auto T>
void func(T arg) {

}
```

- Templates are used so the same piece of code can be used for different data types. This is only useful if the data types can perform the same operations.
	- Maybe this is a good argument to allow for operator overloading.
		- How do you know if a template needs a certain operation? Have conditions.

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
- Naming conventions
	- `_var` for private
	- `_var_` for protected
- `?` for optional
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
- Inheritance
	- The `virtual` keyword is needed so a child class can override
	- The `override` keyword is needed to override a parent's virtual method
	- Use the `pure` keyword in front of the `virtual` keyword to make a pure virtual method.
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


## Todo
- Casting can be done at compile time, where convert functions are done at run time.
- You cannot have containers in other containers.
	- Ex: You can't have a struct defined in a class.

- Heap memory accessed like a regular variable or has to be dereferenced?
```C++
// Neo-C
#i64 test = 10
printLine(test)
	// or
printLine(*test)
// C++
Heap_<int64_t> test = Heap_(10);
printLine(test.get());
```
- Probably just `test`

- Minor syntax enforcements
	- There is no implied conversion with instances of classes so that the syntax for creating an object from a class is consistent.
		- The `explicit` keyword is used on all constructors.
		- What syntax used to create object? I like the =s sign syntax.
	- This is the only syntax which can be used to create an instance of a class
		- What happens when you set an object equal to another one? Does it create a copy or pass a reference?
	- No function like macros, no functions within functions, no inline functions, no assigning functions to variables.
	- && for rvalues should not be used?
		- temp values

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
		- InvalidConversion
		- OutOfRange
	- Should split, join, and typeof be in Convert Library?

- Other
	- How to do functions as arguments. Lamda arguments.
	- multi threading
		- async, await, and promises
		- Built into the language
	- Creating libraries
		- Should be done through the compiler.
		- Should have 2 settings. Include links or not.

## Problem areas of Neo-C
- Metaprogramming
	- function like macros
	- Limited template features

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

## Casting

```C++
// Neo-C
f32 x = 1.5
i32 y = x
  // or
i32 y = (i32)x
  // or
i32 y = (i32)(x)

printLine(y) // 1

// C++
float x = 1.5;
int32_t y = x;
  // or
int32_t y = static_cast<int32_t>(x);

std::cout << y << "\n";
```

```C++
// Neo-C
f32 x = 1.5
i32 y = *(i32*)&x

printLine(y)

// C++
float x = 1.5;
int32_t y = *reinterpret_cast<int32_t*>(&x);

std::cout << y << "\n";
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

## Enums
```C++
// Same as enum class

class Color()
  static enum Colors = {RED, GREEN, BLUE}

  void set(Colors c)
    _color = c

  Colors get()
    return _color

  i64 _color

Color color
color.set()
```

## Casting

doesn't have this special syntax and instead handles conversions through the Convert Library.
This simplifies the syntax of the language and allows for more consistency in handling error handlings.

Casting can be seen as a special syntax for conversion functions.
In Neo-C, casting is replaced with the Convert Library, which handles all conversions. This approach simplifies the language's syntax and ensures more consistent error handling.

Neo-C removes casting in order to simplify the language. Instead, Neo-C provides the Convert library that handles conversions explicitly between different types. There are no implicit conversions in Neo-C and all conversions must be performed deliberately using the Convert functions. These functions can throw errors if the conversion is not possible.
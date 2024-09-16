## Todo
- enum
- special syntax for enum classes

- Casting
- enums and class enums
	- no. Type.
	- Can loop through type like an array.

```C++
// Casting that doesn't throw errors
import {userInput, printLine, print} <Terminal>

bool isInt(char el)
	match el
		case '0'...'9':
			return true
	return false

i32 main()
	enum DayOfTheWeek = {MON, TUE, WED, THU, FRI, SAT, SUN}

	DayOfTheWeek day
	while true
		print("Day of the week (0-6): ")
		string inputLine = userInput()
		if inputLine.isEachElement(isInt)
			i64 input = (i64)inputLine
			if DayOfTheWeek.includes(input)
				day = (DayOfTheWeek)input
			else
				printLine("Input has to be from 0 to 6.")
				continue
		else
			printLine("Input has to be from 0 to 6.")
			continue
		break

	printLine("This is your day of the week: ${day}")
```

```C++
// No casting and Convert functions that throw errors
import {userInput, printLine, print} <Terminal>
import {toI64, toEnum} <Convert>

i32 main()
	enum DaysOfTheWeek = {MON, TUE, WED, THU, FRI, SAT, SUN}

	DaysOfTheWeek day
	while true
		print("Day of the week (0-6): ")
		string inputLine = userInput()
		i64 input
		try
			input = toI64(inputLine)
			day = toEnum<DaysOfTheWeek>(input)
		catch string error
			printLine("Input has to be from 0 to 6.")
			continue
		break

	printLine("This is your day of the week: ${day}")
```


```C++
DayOfTheWeek day = MON

i64 userInput = 10
if DayOfTheWeek.includes(userInput)
	day = (DayOfTheWeek)userInput
else
	



type DayOfTheWeek = "Mon" | "Tue" | "Wed" | "Thu" | "Fri" | "Sat" | "Sun"

DayOfTheWeek day = "Mon"

// What if you do
string input = "Invalid input"
DayOfTheWeek day = input
	// string cannot be converted to DayOfTheWeek

string input = "Invalid input"
if DayOfTheWeek.includes(input)
	DayOfTheWeek day = (DayOfTheWeek)input
else
	// Handle error



if DayOfTheWeek.includes(input)
	DayOfTheWeek day = input
else
	// Handle error

try DayOfTheWeek day = input
	// It isn't a function so it shouldn't throw an error.
catch 


enum DayOfTheWeek = Mon, Tue, Wed, Thu, Fri, Sat, Sun

DayOfTheWeek 
```

- There is no implied conversion with instances of classes so that the syntax for creating an object from a class is consistent.
	- The `explicit` keyword is used on all constructors.
- templates
	- Remove template meta programming
	- https://www.youtube.com/watch?v=sjsnuirLyKM
	- auto as a function argument
- new and delete
	- Allows easy creation of objects on the heap instead of the stack.
	- https://www.youtube.com/watch?v=sjsnuirLyKM
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
- How to do functions as arguments. Lamda arguments.
- Creating libraries
	- Should be done through the compiler.
	- Should have 2 settings. Include links or not.
- asm keyword?
- Smart pointers and nullptr
- `co_await`, `co_return`, `co_yield`?
- `constexpr`, `consteval`, `constinit`
- Use the `?` to wrap things in `std::optional`
	- Don't use optionals for error handling.
- Macros
- All the types of errors
	- InvalidConversion
	- OutOfRange
- Should split and join be in Convert Library?

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
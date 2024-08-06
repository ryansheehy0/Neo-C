# Neo-C
Neo-C is a programming language like C++, but tries to be pleasant to use. It compiles to C++ and can use C++ libraries. It isn't designed to be backwards compatible with C++.
- This language is not done and everything is subject for change.

<img src="./neo_c_logo.svg" width=400>

## Match statements
Switch statements are often used to replace if-else statements, but they typically result in more lines of code due to the required break statements. Match statements are meant to solve this problem.
- You cannot use switch statements in Neo-C. Match statements are used instead.

The match statement is exactly like the switch statement, but the brakes are automatically included.

```C++
// Neo-C
match (var)
	case 1:
	case 2:
	default:

// C++
switch (var) {
	case 1:
		break;
	case 2:
		break;
	default:
		break;
}
```

### Ranges
It is common to perform an action with a range of inputs, such as all lowercase characters, uppercase characters, or digits. Therefore, you can use `...` in match statements to automatically create a range of cases.
- This only works for char or int literals

```C++
// Neo-C
match (var)
	case 'a'...'c':
		// Do something

// C++
switch (var) {
	case 'a':
	case 'b':
	case 'c':
		// Do something
		break;
}
```

### Multiple cases
Instead of using fall-throughs for multiple case labels, you can use a comma `,` to separate different comparisons that should execute the same block of code.

```C++
// Neo-C
match (var)
	case 'a', 'b':

// C++
switch (var) {
	case 'a':
	case 'b':
		break;
}
```

### Strings
C++ doesn't support using strings in switch statements, but Neo-C does for match statements.
- Ranges(`...`) don't work for strings

```C++
// Neo-C
std::string str = "abc"
match (str)
	case "a", "ab":
		// Do something
	case "abc":
		// Do something

// C++
std::string str = "abc";
if (str == "a" || str == "ab") {
	// Do something
}else if (str == "abc") {
	// Do something
}
```

## Importing and Exporting
It's annoying to have a separate header file to define your exports, especially when you change a declaration in your code and then have to change it in the header file as well.

The `#export` keyword is used to automatically construct an .h file with the same name as the .nc file.

```C++
// Neo-C
#export int func()

// C++
#progma once
int func();
```

- These automatically have include guards(`#progma once`) added at the top.
- If `#export` is used in a .nc file, when it compiles into its .cpp file, then its header file is automatically included at the top. `#include "file.h"`

## Automatic function hoisting
When you define a function it is automatically given a function prototype at the start of the file to allow for automatic function hoisting. This prevents having to worry about matching the prototype and the declaration.

```C++
// Neo-C
void func(int arg)
	// Do something

// C++
void func(int);

void func(int arg){
	// Do something
}
```

## Semi-Colons, curly brackets, and code formatting
Neo-C enforces a certain style to your code. This is to allow a common look and feel to Neo-C.

- Semi-colons cannot be used.
- Curly brackets cannot be used and are replaced by indentations.
	- You can use either tab or space indentation.
- Spaces are required before any `()`s, but functions and classes cannot have spaces after it.
	- `if ()`, `for ()`, `while ()`, etc.
	- `void func(int arg)`, `func(arg)`, `class Class(int arg)`, etc.

## For each loops
C++ doesn't have a simple way to loop through an array and get each element. There are ranged based for loops, but you can't easily include the index and it cannot be used for C style arrays. In Neo-C there is a special for loop syntax for these operations.
- You cannot use ranged based for loops in Neo-C. This for loop is used instead.
- The index has to be included

```C++
// Neo-C
std::string str = "This is a test."
for (char element, int index in str of size str.length())
	std::cout << element << std::endl

// C++
std::string str = "This is a test.";
for (int index = 0; index < str.length(); index++) {
	char element = str[index];
	std::cout << element << std::endl;
}
```

- This can also work for references.

```C++
// Neo-C
char abcs[26]
for (char &letter, int i in abcs of size 26)
	letter = 97 + i

// C++
char abcs[26];
for (int i = 0; i < 26; i++){
	char &letter = abcs[i];
	letter = 97 + i;
}
```

- This syntax is easy translated to english: for each `element` and `index` in `array` of size `array_size` do something.

## Classes
In C++ it is often necessary to have arguments for your constructor where those arguments get automatically assigned to variables inside the class. It can be very annoying just reassigning variables. To solve this Neo-C has a different syntax for constructors and classes.

```C++
// Neo-C
enum Sex
	Male,
	Female,
	Other

class Person(public int age, public int height, private int weight, private Sex sex)
	public int getWeight()
		if (sex == Male)
			return weight
		else
			return -1

	public void setWeight(int weight)
		this->weight = weight

// C++
enum Sex {
    Male,
    Female,
		Other
};

class Person {
	private:
			int weight;
			Sex sex;
	public:
			int age;
			int height;

			Person(int age, int height, int weight, Sex sex) {
					this->age = age;
					this->height = height;
					this->weight = weight;
					this->sex = sex;
			}

			int getWeight() {
					if (sex == Male) {
							return weight;
					} else {
							return -1;
					}
			}

			void setWeight(int weight) {
					this->weight = weight;
			}
};
```

## Nested Comments
When you need to comment out a large chunk of code, but that code already has a multi-line comment in it, you have to remove the inner `*/`. This is annoying so Neo-C adds the ability to do nested multi-line comments.

```C++
// Neo-C
/*
	/*inner comment*/
	This is also a comment
*/

// C++
/*
	/*inner comment
	This is also a comment
*/
```
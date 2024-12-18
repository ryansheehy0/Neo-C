[Back](./Readme.md)

# Match Statements
In C++, switch statements take up more lines because of the mandatory break statements. Neo-C replaces switch statements with match statements, which don't require the breaks.
- Code cannot be placed on the same line as the case statement itself. It has to be indented on its own line.

```C++
// Neo-C
match (var)
	case (1)
		print("one")
	case (2)
		print("two")
	case (...)
		print("default")

// C++
switch (var) {
	case 1:
		print("one");
		break;
	case 2:
		print("two");
		break;
	default:
		print("default");
		break;
}
```

### Ranges
Neo-C allows you to do case ranges with constants. Such as all lowercase characters.

```C++
// Neo-C
match (var)
	case ('a'...'c')
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

### Fall throughs
Since break statements are automatically included, you can use the `fall` keyword to fall through to the next case.

```C++
// Neo-C
match (var)
	case (1)
		// Do something
		fall
	case (2)
		// Do something else

// C++
switch (var) {
	case 1:
		// Do something
	case 2:
		// Do something else
		break;
}
```

### Multiple cases
Instead of always using `fall`, you can use a comma to separate different comparisons.

```C++
// Neo-C
match (var)
	case ('a', 'b')

// C++
switch (var) {
	case 'a':
	case 'b':
		break;
}
```

### Breaks
`break`s can be used in match statements to break out of an outer loop.

```C++
// Neo-C
while (true)
	match (var)
		case (1)
			break

// C++
while (true) {
	switch (var) {
		case 1:
			goto break_loop;
			break;
	}
}
break_loop:
```

### Strings
Strings can work in match statements.
- Ranges(`...`) don't work for strings

```C++
// Neo-C
string str = "abc"
match (str)
	case ("a", "ab")
		// Do something
	case ("abc")
		// Do something

// C++
NeoC_String str("abc");
if (str == "a" || str == "ab") {
	// Do something
} else if (str == "abc") {
	// Do something
}
```
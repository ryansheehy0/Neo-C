[Back](./Readme.md)

# Match Statements
In C++, switch statements take up more lines because of the mandatory break statements. Neo-C replaces switch statements with match statements, which don't require the breaks.

```C++
// Neo-C
match (var)
  case 1: printLine(1)
  case 2:
    printLine(2)
  default: printLine("default")
    printLine("default")

// C++
switch (var) {
  case 1: std::cout << 1 << "\n";
    break;
  case 2:
    std::cout << 2 << "\n";
    break;
  default: std::cout << "default" << "\n";
    std::cout << "default" << "\n";
    break;
}
```

### [Ranges](#neo-c)
Neo-C allows you to do case ranges with constants. Such as all lowercase characters.

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

### [Fall throughs](#neo-c)
Since break statements are automatically included, you can use the `fall` keyword to fall through to the next case.

```C++
// Neo-C
match (var)
  case 1:
    // Do something
    fall
  case 2:
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

### [Multiple cases](#neo-c)
Instead of always using `fall`, you can use a comma to separate different comparisons.

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

### [Breaks](#neo-c)
Breaks can be used in match statements to break out of an outer loop.

```C++
// Neo-C
while (true)
  match (var)
    case 1:
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

### [Strings](#neo-c)
Strings can work in match statements.
- Ranges(`...`) don't work for strings

```C++
// Neo-C
string str = "abc"
match (str)
  case "a", "ab":
    // Do something
  case "abc":
    // Do something

// C++
String_ str("abc");
if (str == "a" || str == "ab") {
  // Do something
} else if (str == "abc") {
  // Do something
}
```
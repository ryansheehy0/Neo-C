## Match
- You cannot use switch statements
```C++
// Simple Lang
match (var)
	case 0
	case 'a'...'c'
	case 'A', 'B'
	default

// C++
switch (var) {
	case 0:
		break;
	case 'a':
	case 'b':
	case 'c':
		break;
	case 'A':
	case 'B':
		break;
	default:
		break;
}
```
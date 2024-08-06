## Possibly included features
- Negative indexing an array
```C++
// Neo-C
arr[-1]
arr[+1]

// C++
arr[arr.length() - 1]
arr[arr.length() + var]
	// Maybe also include vector.size()
```
- Standard namespaces automatically included when used?
	- `using std::string`
- Remove structs
- Remove enum classes. Use namespaces and enums.
	- You can achieve the same result by putting an enum inside a namespace.

Bloat
C++ includes many nice features over C, but it also includes a lot of bloat.

List of removed features:

- Treating arrays as pointers when passed as arguments?
- delete keyword?
- no structs
	- You can just use a class
- Remove enum classes?
- Use the C++ compiler for any error checking.
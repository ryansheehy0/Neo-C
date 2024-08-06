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

- Async await?

- ... for file paths(Probably not)
	- Recursively search. Good idea.
	- YourProjectFolder/.../file.h
	- Allows you to change things around in your project without going in an changing the file paths.
		- This makes compile time longer though because it has to recursively search
		- This also forces you to not have duplicate file names in your project.
	- Why not have the feature of when you move a file, it searches through all your code and updates the file path.
		- That would be better.
		- Just an extension and doesn't have to be built into the language.

Bloat
C++ includes many nice features over C, but it also includes a lot of bloat.

List of removed features:

- Treating arrays as pointers when passed as arguments?
- delete keyword?
- no structs
	- You can just use a class
- Remove enum classes?
- Use the C++ compiler for any error checking.
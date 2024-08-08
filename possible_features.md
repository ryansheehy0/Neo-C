## Possibly included features
- Negative indexing an array
```C++
// Neo-C
arr[-1]
arr[+1]
arr-[1]

// C++
arr[arr.length() - 1]
arr[arr.length() + var]
	// Maybe also include vector.size()
```
## Negative array indexing
In C++ there is no way to easily get an element starting from the last index. Therefore Neo-C adds additional syntax for indexing in the opposite direction.
- The compiler has to know the size of the array.
	- `sizeof(arr) / sizeof(arr[0])`
	- `vec.size()`

```C++
// Neo-C
int arr[] = {0, 1, 2}
int lastElement = arr-[-1]
int secondToLastElement = arr-[-2]

// C++ This Code does not work
int arr[] = {0, 1, 2};
int lastElement = *(arr - -1);
int secondToLastElement = *(arr - -2);
```

- Standard namespaces automatically included when used?
	- `using std::string`
- Remove structs
- Remove enum classes. Use namespaces and enums.
	- You can achieve the same result by putting an enum inside a namespace.
- Naming conventions
	- When creating functions or variables you have to use camelCase.
		- `int thisIsAVar`, `int thisIsAFunc()`
	- When creating classes, enums you have to use PascalCase.
		- `class ThisIsAClass()`
	- Enforcement is applied only when creating things, not when using them, to ensure compatibility with other people's C++ code.
	- Maybe not because people then can't swtich Neo-C if their libraries use snake case
- const has to be in fornt of any data type.
	- `const auto` instead of `auto const`
- Inline functions should still be allowed to use curly brackets?

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

## Breaking out of nested loops
If you have a loop in a loop you can add an additional break statement to break out of both loops.

```C++
// Neo-C
for (auto el in vec)
	for (auto el2 in vec2)
		for (auto el3 in vec3)
			break break

// C++
for (auto el : vec) {
	for (auto el2 : vec2) {
		for (auto el3 : vec3) {
			goto break_loops;
		}
	}
	break_loops:
}
```

- These breaks can be strung together to break out of any amount of loops. Ex: `break break break` etc.
- If multiple multi-breaks are used inside the same function, a number is added to the end of the label to prevent conflicting goto jumps. Ex: `break_loops_2`

- Remove labels and gotos

- Are there any other use cases for labels besides gotos?
	- Not really. Why not remove labels if you can remove gotos?
		- Just keep it in incase it can be used somewhere. It doesn't hurt anything.
- What are all the use cases of gotos?
	- Breaking out of nested loops
	- Exiting a loop in a switch statement.
	- Goto an error condition

```C++
#include <stdlib.h>

#define HEADER_LEN 1024

int main(int argc, char *argv[]) {
	int retval = 0;

	int fd = open("./server.config", O_RDONLY);
	if (fd == -1) {
		perror("open");
		return -1;
	}
	
	void *filebuf = malloc(CONFIG_LEN);
	if (filebuf == NULL) {
		perror("malloc");
		retval = -1;
		goto leave_fd;
	}
	
	int sfd = socket(AF_INET, SOCK_STREAM, NULL);
	if (sfd == -1) {
		perror("socket");
		retval = -1;
		goto leave_filebuf;
	}
	
	retval = 0;
	close(sfd);
	
	leave_filebuf:
	free(filebuf);

	leave_fd:
	close(fd);
}
```
- Use a separate function to handle clean up?
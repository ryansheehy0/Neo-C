[Back](./Readme.md)

- `#` for unique
- `@` for shared

# Heap memory
Not Done.

How can you transfer ownership? How do smart pointers transfer ownership?

In C++, to allocate memory on the heap you use the `new` keyword. Once done being used, this heap memory has to then be deallocated with the `delete` keyword. This has 3 main problems.

1. Forgetting to call delete causing memory leaks.
2. Deleting memory twice.
3. Using memory that was already deleted.

To solve these problems Resource Acquisition is Initialization(RAII) was created. RAII is an idea in which a corresponding pointer on the stack is created when heap memory is allocated. When this pointer gets popped, aka goes out of scope, then the corresponding heap memory also gets deleted. This removes the need for a `delete` keyword and solves those 3 problems.

Neo-C removes the `new` and `delete` keywords and only allows heap memory to be created with a corresponding stack pointer. This can be done using the inbuilt `#` syntax.

```C++
// Neo-C
#i64 mem = 10
printLine(mem)

// C++
Heap_<int64_t> mem = Heap_(10);
std::cout << mem.get_() << "\n";
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
- Maybe have two keywords, `unique` and `shared` for creating the two types of heap memory.

- Built in functions: `move`, `get`, `reset`, `release`, `count`, `swap`, `lock`, `expired`
	- Maybe make all of these methods.
- Weak pointers
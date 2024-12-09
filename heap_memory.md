[Back](./Readme.md)

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
[Back](./Readme.md)

# Data Types
C++ has some problems with its default data types, which Neo-C corrects.

- Maybe don't allow for the creation of concrete data types, only implementations of abstract data types.
	- Ex: Instead of creating an array, you can only create a ArrayList, ArrayStack, ArrayQueue, etc.

1. Data types don't have explicitly defined lengths.
	- Ex: An `int` can be 32 bits, or 64 bits depending upon the platform. This can be a problem if the code expects `int` to be 64 bits, but the platform only supports 32 bits.
2. Strings and dynamic arrays aren't built into the language.
	- These are so commonly used that they should be built into the language.
3. There are multiple ways of creating arrays with `std::array` and C-style arrays.

## Built in data types
- `bool`
- `i8`, `i16`, `i32`, `i64`
- `u8`/`char`, `u16`, `u32`, `u64`
- `f32`, `f64`
- `string`
- `type[]` for fixed size arrays on the stack
- `type[dynamic]` for dynamic arrays on the heap

### Strings and arrays
Under the hood, strings and arrays are inherited from the abstract class DataStructure, which has many inbuilt methods that can be used. This class, DataStructure, can be imported from the DataStructure library, allowing you to create your own data structures.

You can view the DataStructure class [here](./Standard_Libraries/standard_libraries.md).

- The classes are named `NeoC_String`, `NeoC_Array`, and `NeoC_DynamicArray`.

## Casting/Converting
In Neo-C, casting is done by calling the type as a function, like `type()`.
- There is no implicit casting/converting because castings can throw errors.
- Float literals have to have decimal points. Ex: `f64 x = 10.0`
- Integer literals cannot have decimal points. Ex: `i64 x = 10`

In Neo-C, the `pointer` keyword allows you to cast to a pointer type while preserving the underlying bits.

```C++
f32 a = 1.5
// Change the underlying bits
i32 b = i32(a) // 1
// Keep the underlying bits the same
i32 c = *pointer<i32>(&a) // 1069547520
```

- You can perform a `pointer` cast on a `const` type because it doesn't alter the underlying bits. However, other types of casts aren't allowed.
	- You cannot remove const like you can in C++.

## Other notes
- `auto` can be used to get the type based on its initialized value.
- `null` is a keyword which is the same as 0.
	- There is no `nullptr` keyword. Use `null` instead.
- Arrays work similarly to those in C++. They don't need a size if they are initialized.
- `""`s return a string and not a const char[].
- Arrays are set with `[]`s instead of `{}`s

```C++
// Neo-C
i64[] arr = [1, 2, 3, 4, 5]

// C++
int64_t arr[] = {1, 2, 3, 4, 5};
```
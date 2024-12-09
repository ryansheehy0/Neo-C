[Back](./Readme.md)

## [Data Types](#neo-c)
C++ has some problems with its default data types, which Neo-C corrects.

1. Data types don't have explicitly defined lengths.
    - Ex: An `int` can be 32 bits, or 64 bits depending upon the platform. This can be a problem if the code expects `int` to be 64 bits, but the platform only supports 32 bits.
2. Dynamic arrays and strings aren't built into the language.
3. There are multiple ways of creating arrays with `std::array` and C-style arrays.

### [Built in data types](#neo-c)
- `auto`
- `bool`
- `i8`, `i16`, `i32`, `i64`
  - C++: `int8_t`, `int16_t`, `int32_t`, `int64_t`
- `u8`/`char`, `u16`, `u32`, `u64`
  - C++: `uint8_t`, `uint16_t`, `uint32_t`, `uint64_t`
- `f32`, `f64`
  - C++: `float`, `double`
- `string`
  - C++: `String_`
- `type[size] name`
  - C++: `Array_<type> name(size);` or `Array_<type> name(anotherArray);`
- `type[dynamic] name`
  - C++: `DynamicArray_<type> name(size);` or `DynamicArray_<type> name(anotherArray);`

Arrays are set with `[]`s instead of `{}`s

```C++
// Neo-C
i64[] arr = [1, 2, 3, 4, 5]

// C++
int64_t arr[] = {1, 2, 3, 4, 5};
```

`nullptr` and `null` both are keywords that are the same as 0.

### [Built in string and array methods](#neo-c)

| Array, string, and dynamic array methods  | Description                                                                        |
|-------------------------------------------|------------------------------------------------------------------------------------|
| .size() or .length()                      | Gets the size/length.                                                              |
| .at(index)                                | Allows for negative array indexing. Ex: -1 is the last element.                    |
| .subarr(startIndex, optional endIndex)  | Returns a sub array from startIndex to endIndex or the end of the array.           |
| .substr(startIndex, optional endIndex) | Returns a string from startIndex to endIndex or the end of the string.             |
| .sort(optional function)                  | Returns a sorted array/string from lowest to highest.                              |
| .reverse()                                | Returns a reversed array/string.                                                   |
| .contains(value) or .includes(value)      | Does the value exist in the array?                                                 |
| .binaryContains(value) or .binaryIncludes(value)    | Uses binary search. Array/string is assumed to be sorted.                |
| .find(value)                              | Gets the index of the value.                                       |
| .binaryFind(value)                                  | Uses binary search. Array/string is assumed to be sorted.                |
| .fill(value, start, optional end)         | Fills the value from the start index to the end index or to the end of the array.  |
| .map(function)                            | Applies the function to each element of the array and returns that array.          |
| .filter(function)                         | Returns a filtered array. If the function returns true it gets filtered out.       |

- The function passed to these methods have these arguments: `func(element, optional index, optional array)`

| String and dynamic array methods            | Description                                                           |
|---------------------------------------------|-----------------------------------------------------------------------|
| .allocate(size)                             | Sets the allocated memory size.                                       |
| .allocationSize()                           | Gets the allocation size of memory.                                   |
| .push(value)                                | Pushes an element on the end.                                         |
| .pop()                                      | Removes and returns the last element on the end.                      |
| .unshift(value)                             | Puts an element on the beginning.                                     |
| .shift()                                    | Removes the first element and returns it.                             |
| .insert(index, value, optional value, etc.) | Inserts the value or values at the index.                             |
| .remove(index, optional howMany)            | Removes the element at the index and the next howMany(defaults to 1). |

| String methods | Description                                           |
|----------------|-------------------------------------------------------|
| .toUpperCase() | Converts string to upper case.                        |
| .toLowerCase() | Converts string to lower case.                        |
| .trimStart()   | Removes any white space in front of the string.       |
| .trimEnd()     | Removes any white space at the back of the string.    |
| .trim()        | Removes any white space in the front and at the back. |

- You can use `array1 + array2` or `string1 + string2` to do concatenation.
- These methods can throw errors if the index is out of range.
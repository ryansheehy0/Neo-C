[Back](./Readme.md)

# Templates
In Neo-C, templates are created very similarly to those in C++, however there are some notable changes.
- There is no `typename`. Instead just use `auto`.
- `auto` cannot be an argument type. You have to use a template.

```C++
// Neo-C
template<auto Type>
Type add(Type value1, Type value2)
  return value1 + value2
```

## Requirements
In Neo-C, you can create requirements for template arguments that are checked at compile time. These requirements can be combined together using `&&`, `||`, `!`, and parentheses.
- The requirements can only be classes or built in data types(like `bool`, `i8`, `i16`, etc).

```C++
// Neo-C
class Addable
  public
    Addable operator+(const Addable& rhs)
    This operator+(const This& rhs) // You can also do this.

class Subtractable
  public
    Subtractable operator-(const Subtractable& rhs)


template<Addable && Subtractable Type>
Type someMathFunc(Type value1, Type value2)
  return value1 + value1 - value2
```

## Using classes as template requirements
Let's say you want to create a function that prints all the elements in any type of data structure. Like this:

```C++
// Neo-C
void printAll(const DataStructure& dataStructure)
	for (auto ele in dataStructure)
		print(string(ele))
```

The problem with this approach is the run time costs associated with using a base class like DataStructure. A virtual table has to be used, therefore slowing down run time performance. To get around this we can pass the iterators as separate arguments. Something like this:

```C++
// Neo-C
void printAll(Iterator begin, Iterator end)
  for (auto iter = begin; iter != end; iter++)
    print(string(*iter))
```

However, this makes the syntax for calling printAll kind of messy, `printAll(arr.begin(), arr.end())`. It would be nice to be able to just do `printAll(arr)`. To solve this problem, Neo-C allows you to make a class a requirement into a template. Like this:

```C++
// Neo-C
template<DataStructure Type>
void printAll(const Type& dataStructure)
  for (auto ele in dataStructure)
    print(string(ele))
```

This removes the run time costs associated with passing base classes as arguments, but still allows for the nice syntax of `printAll(arr)`. And this feature can be extended further by allowing it to be put into the DataStructure class itself. Like this:

```C++
class DataStructure
  public
    // Other public methods

    template<This T>
    void printAll(T* this) // Overwrite the "this" keyword to allow its type to be determined at compile time.
      for (auto ele in this)
        print(string(ele))
```

This allows for the syntax of `arr.printAll()` with no run time penalties.
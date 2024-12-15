[Back](./Readme.md)

- Have templates on their own line. More like C++.
  - Also have the template keyword
- Make it very similar to Backus-Naur form grammar
- Can have classes as requirements

# Templates
In Neo-C, templates are created very similarly to those in C++, however there are some notable changes.
- There is no `typename`. Instead just use `auto`.
- `auto` cannot be an argument type. You have to use a template.

```C++
// Neo-C
```


In Neo-C, templates are defined by placing angle brackets `<>`s after the name. The `auto` keyword can be used to define a template argument that accepts any type. This replaces C++'s `typename` and `class`.

```C++
auto add<auto Type1, auto Type2>(Type1 value1, Type2 value2)
  return value1 + value2
```

In Neo-C, you can create requirements for template arguments that are checked at compile time. Requirements can only have one template argument defined.

```C++
requirement Addable<auto Type>
  Type + Type

auto add<Addable Type1, Addable Type2>(Type1 value1, Type2 value2)
  return value1 + value2
```

The logical operators `&&`, `||`, `!`, and parentheses `()` are supported for combining requirements inside templates.

```C++
requirement Subtractable<auto Type>
  Type - Type

requirement Addable<auto Type>
  Type + Type

auto someMathFunc<Addable && Subtractable Type1, Addable && Subtractable Type2>(Type1 value1, Type2 value2)
  return value1 + value2 - value1
```

You can also define specific types required for template arguments.

```C++
requirement Int<i8 || i16 || i32 || i64 Type>
  Type

requirement Addable<auto Type>
  Type + Type
```

See the [requirement library](./requirement_library.md) for built in requirements.

## Using base classes as template requirements
Let's say you want to create a function that prints all the elements in any type of data structure. Like this:

```C++
// Neo-C
void printAll(const DataStructure& dataStructure)
	for (auto ele in dataStructure)
		print(string(ele))
```

The problem with this approach is the run time costs associated with using an abstract class like DataStructure. A virtual table has to be used, therefore slowing down run time performance. To get around this we can pass the iterators as separate arguments. Like this:

```C++
// Neo-C
template<auto T>
void printAll(T.Iterator begin, T.Iterator end)
  for (auto iter = begin; iter != end; iter++)
    print(string(*iter))
```

However, this makes the syntax for calling printAll kind of messy, `printAll(arr.begin(), arr.end())`. It would be nice to be able to just do `printAll(arr)`. To solve this problem, Neo-C allows you to make a class a requirement into a template. Like this:

```C++
// Neo-C
template<DataStructure T>
void printAll(const T& dataStructure)
  for (auto ele in dataStructure)
    print(string(ele))
```

This removes the run time costs associated with passing abstract classes as arguments, but still allows for the nice syntax of `printAll(arr)`.
- Any class can be used as a requirement. It's just most useful when that class is an abstract class.

And this feature can be extended further by allowing it to be put into the DataStructure class itself. Like this:

```C++
class DataStructure
  public
    // Other public methods

    template<This T>
    void printAll(T this) // Overwrite the "this" keyword to allow its type to be determined at compile time.
      for (auto ele in this)
        print(string(ele))
```

This allows for the syntax of `arr.printAll()` with no run time penalties.
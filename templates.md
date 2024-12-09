[Back](./Readme.md)

# Templates
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
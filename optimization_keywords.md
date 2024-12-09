[Back](./Readme.md)

# Optimization keywords
- `cache`
  - When a function is called again with the same arguments, it doesn't recompute, but instead passes the value that was already calculated.
- `inline`
- `compile` is used instead of `constexpr`

In Neo-C, you can avoid worrying about functions or constants being executed at runtime when they can be computed during compile time. Specifically, the following conditions must be met for functions or constants to be processed at compile time:
1. Compile time functions:
  - All the arguments must be known at compile time.
  - The function is pure. It must not use any inputs other than the arguments. Ex: using a pointer, static variables, etc.
2. Compile time constants:
  - Its value must be known at compile time.
  - No other part of the program references it's address.

```C++
// Neo-C
const i64 FIVE_FACTORIAL = factorial(5)

i64 factorial(i64 value)
  if value == 0 return 1
  return value * factorial(value - 1)

// Compiled C++
const int64_t FIVE_FACTORIAL = 120;

int64_t factorial(nt64_t value) {
  if (value == 0) return 1;
  return value * factorial(value - 1);
}
```

This avoids the need for magic numbers and comments by utilizing functions instead. Unlike comments, which may not reflect the current code, functions consistently produce the intended results.
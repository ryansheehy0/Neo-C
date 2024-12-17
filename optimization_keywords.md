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

## Compile
This avoids the need for magic numbers and comments by utilizing functions instead. Unlike comments, which may not reflect the current code, functions consistently produce the intended results.

In Neo-C, you can have functions be evaluated at compile time if the arguments to those functions can also be calculated at compile time. This can be done by putting the `compile` keyword before a function call.

```C++
i32 main()
	const i64 FIVE_FACTORIAL = compile factorial(5) // This is valid
	i64 var = 6
	const i64 SIX_FACTORIAL = compile factorial(var) // This is invalid because var isn't known at compile time.

i64 factorial(i64 value)
	if value == 1 return 1
	return value * factorial(value - 1)
```

## Inline
Neo-C also allows constants to be copied and pasted by the compiler. The value of the constant has to be defined at compile time. This can be done using the `copy&paste` keyword.

```C++
copy&paste const i64 PI = 3.14
```

These two keywords can be combined to allow the values of constants to be calculated at compiled time and then copied and pasted into the code.

```C++
copy&paste const i64 FIVE_FACTORIAL = compile factorial(5)
```

This maybe needed.
	- The compiler might not have enough information to know.
	- Need a keyword for compile time if statements.

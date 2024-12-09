[Back](./Readme.md)

# Error handling
If you want to crash the program when an error is detected you can simply use `exit(1)` from the Error library. However, what happens when you want to continue to run your code even when there's an error?

In C, functions often return -1 when there's an error. However, there are a few notable problems with this approach.
1. What if the function wants to return -1 as a valid result and not as an error.
2. There's no way to know what type of error occurred. You can't pass extra information along with -1.
3. A lot of boiler plate code is needed when you want to propagate errors upwards so that they can be handled by a higher level function.

```C++
f64 func()
  f64 result = func2()
  if result == -1
    // Handle error
  // Use result

f64 func2()
  f64 result = divide(1, 0)
  if result == -1
    return -1
  // Use result

f64 divide(f64 numerator, f64 denominator)
  if denominator == 0
    return -1
  return numerator / denominator
```

What's often done to solve the 1st and 2nd problems are to wrap the output of the function in an `Error<returnType, errorType>`, but this doesn't solve the 3rd problem. In fact, it worsens the amount of boiler plate code because now you have to wrap everything in an Error type.
- This is similar to how GoLang handles errors, but GoLang allows functions to return multiple values, one of which can be an error.

```C++
f64 func()
  Error<f64, string> result = func2()
  if result.error()
    string error = result
    // Handle error
  // Use result

Error<f64, string> func2()
  Error<f64, string> result = divide(1, 0)
  if result.error()
    return result
  // Use result

Error<f64, string> divide(f64 numerator, f64 denominator)
  if denominator == 0
    return {0, "Cannot divide by zero."}
  return {numerator / denominator, ""}
```

How most languages have solve these problems is through `try`, `catch`, and `throw`. Throwing an error allows that error to bubble up until it is caught by a corresponding catch statement. If it doesn't get caught, the program crashes. This removes a lot of boiler plate code.

```C++
f64 func()
  f64 result
  try
    result = func2()
  catch string error
    // Handle error
  // Use result

f64 func2()
  f64 result = divide(1, 0)
  // Use result

f64 divide(f64 numerator, f64 denominator)
  if denominator == 0
    throw "Cannot divide by zero."
  return numerator / denominator
```

`try`, `catch`, and `throw` removes a lot of the boilerplate code, but it introduces some more problems.
1. It isn't clear if a function can throw an error and what type of error it can throw.
2. It makes it easy to ignore errors, which results in them being discovered at run time instead of when the code is being written.

To solve these two problems, Neo-C requires functions to explicitly specify the types of errors they can throw using `void func() : errorType1, errorType2`. Any function calling another function that throws errors must also declare those error types if they remain uncaught.

```C++
f64 func()
  f64 result
  try
    result = func2()
  catch string error
    // Handle error
  // Use result

f64 func2() : string
  f64 result = divide(1, 0)
  // Use result

f64 divide(f64 numerator, f64 denominator) : string
  if denominator == 0
    throw "Cannot divide by 0."
  return numerator / denominator
```

One annoying thing about try-catch blocks is their scoping. Any variable declared within the block cannot be used outside of it. This is the case because a variable may not be declared if a function before it throws an exception. See [The Actual Dumbest Thing About Try/Catch](https://www.youtube.com/watch?v=Ppj0j-5v0Qg). As a result, you have to declare all variables before the try-catch block, which can be very annoying. To solve this, Neo-C allows single line `try` statements that don't create a new scope, allowing variables to be declared and then used after the `catch`.

```C++
f64 func()
  try f64 result = func2()
  catch string error
    // Handle error
  // Use result

f64 func2() : string
  f64 result = divide(1, 0)
  // Use result

f64 divide(f64 numerator, f64 denominator) : string
  if denominator == 0
    throw "Cannot divide by 0."
  return numerator / denominator
```

- Use `catch` for the default catch instead of `catch ...`
- In classes, when you use `const` it has to be before any specified errors.
  - Ex: `void func() const : ErrorType`

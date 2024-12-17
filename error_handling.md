[Back](./Readme.md)

# Error handling
If you want to crash the program when an error is detected you can simply use `exit(i32 errorCode)`. However, what happens when you want to continue to run your code even when there's an error?

In C, functions often return -1 or 0 when there's an error. However, there are a few notable problems with this approach.
1. A function cannot return -1 or 0 as a valid result.
2. There's no way to know what type of error occurred.
3. A lot of boiler plate code is needed when you want to propagate errors upwards.

```C++
f64 divide(f64 numerator, f64 denominator)
  if (denominator == 0)
    return -1
  return numerator / denominator

f64 func2()
  f64 result = divide(1, 0)
  if (result == -1)
    return -1 // Propagate the error upwards
  // Use result

f64 func()
  f64 result = func2()
  if (result == -1)
    // Handle error
  // Use result
```

What's often done to solve the 1st and 2nd problems are to wrap the output of the function in some kind of error object(`Error<returnType, errorType>`), but this doesn't solve the 3rd problem. In fact, it worsens the amount of boiler plate code because now you have to wrap everything in an Error type.
- This is similar to how GoLang handles errors, but GoLang allows functions to return multiple values, one of which can be an error.

```C++
Error<f64, string> divide(f64 numerator, f64 denominator)
  if (denominator == 0)
    return {0, "Cannot divide by zero."}
  return {numerator / denominator, ""}

Error<f64, string> func2()
  Error<f64, string> result = divide(1, 0)
  if (result.error())
    return result // Propagate the error upwards
  // Use result

f64 func()
  Error<f64, string> result = func2()
  if (result.error())
    // Handle error
  // Use result
```

Most languages have solved these problems through `try`, `catch`, and `throw`. Throwing an error allows that error to bubble up until it is caught by a corresponding catch statement. If it doesn't get caught, the program crashes. This removes a lot of boiler plate code.

```C++
f64 divide(f64 numerator, f64 denominator)
  if (denominator == 0)
    throw "Cannot divide by zero."
  return numerator / denominator

f64 func2()
  f64 result = divide(1, 0) // Errors automatically propagate upwards
  // Use result

f64 func()
  f64 result
  try
    result = func2()
  catch (string error)
    // Handle error
  // Use result
```

`try`, `catch`, and `throw` removes a lot of the boilerplate code, but it introduces some more problems.
1. It isn't clear if a function can throw an error and what type of error it can throw.
2. It makes it easy to ignore errors, which results in them being discovered at run time instead of when the code is being written.

To solve these two problems, Neo-C requires functions to explicitly specify the types of errors they can throw using the `throws` keyword(`void func() throws errorType1, errorType2`). Any function that calls another function capable of throwing errors must also declare those error types if they are not caught.

```C++
f64 divide(f64 numerator, f64 denominator) throws string
  if (denominator == 0)
    throw "Cannot divide by 0."
  return numerator / denominator

f64 func2() throws string
  f64 result = divide(1, 0)
  // Use result

f64 func()
  f64 result
  try
    result = func2()
  catch (string error)
    // Handle error
  // Use result
```

One annoying thing about try-catch blocks is their scoping. Any variable declared within the block cannot be used outside of it. This is the case because a variable may not be declared if a function before it throws an error. See [The Actual Dumbest Thing About Try/Catch](https://www.youtube.com/watch?v=Ppj0j-5v0Qg). As a result, you have to declare all variables before the try-catch block, which can be very annoying. To solve this, Neo-C allows single line `try` statements that don't create a new scope, allowing variables to be declared and then used after the `catch`.
- When transpiled to C++, the variable is declared outside the try scope, ensuring it is always defined. This is different to how other one line statements work in Neo-C.

```C++
f64 divide(f64 numerator, f64 denominator) throws string
  if (denominator == 0)
    throw "Cannot divide by 0."
  return numerator / denominator

f64 func2() throws string
  f64 result = divide(1, 0)
  // Use result

f64 func()
  try f64 result = func2()
  catch (string error)
    // Handle error
  // Use result
```

Neo-C allows the use of an `else` block with a try-catch, allowing you to keep a one-line try block while still having conditional code for errors.

```C++
try File file = openFile("./file.txt")
catch (...)
  print("Cannot open file.txt")
else
  print("Opened file.txt")

// vs

File file
try
  file = openFile("./file.txt")
  print("Opened file.txt")
catch (...)
  print("Cannot open file.txt")
```

- `catch (...)` can be used to catch any type of error.
- In classes, when you use `const` it has to be before any errors.
  - Ex: `void func() const throws ErrorType`
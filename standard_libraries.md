# Neo-C Standard Libraries

**Not Done**

<!-- TOC -->

- [Terminal](#terminal)
- [Math](#math)
- [File](#file)
- [Time](#time)
- [HTML](#html)
- [Regex](#regex)
- [Network](#network)
- [Encrypt](#encrypt)
- [LinkedList](#linkedlist)
- [Test](#test)
- [Bash](#bash)
- [Convert](#convert)
- [Error](#error)
- [Arguments](#arguments)
- [Draw](#draw)
- [ML](#ml)

<!-- /TOC -->

## [Terminal](#neo-c-standard-libraries)
The Terminal library is used to interact with the terminal.

| Output Functions                                   | Description                                              |
|----------------------------------------------------|----------------------------------------------------------|
| void print(string msg)                             | Prints the message without a new line.                   |
| void printLine(string msg)                         | Automatically adds a new line to the end.                |
| void printError(string msg)                        | Prints an error message without a new line.              |
| void printLineError(string msg)                    | Prints an error message with a new line.                 |
| void setTextColor(i8 red, i8 green, i8 blue)       | Sets the text color for future prints.                   |
| void resetTextColor()                              | Resets the text color to default.                        |
| void setBackgroundColor(i8 red, i8 green, i8 blue) | Sets the background color for future prints.             |
| void resetBackgroundColor()                        | Resets the background color to default.                  |
| void setFloatPrecision(i64 decimalPlaces)          | Sets the decimal places for float outputs(default is 2). |

| Input Functions                          | Description                                                                 |
|------------------------------------------|-----------------------------------------------------------------------------|
| string read()                            | Reads user input without outputting a new line when the user presses enter. |
| string readLine()                        | Reads user input and outputs new line when the user presses enter.          |
| string readPassword()                    | User input is invisible. No new line after enter.                           |
| string readLinePassword()                | User input is invisible. New line after enter.                              |
| string readTabCompletion()               | Tab autocompletion for files. No new line after enter.                      |
| string readLineTabCompletion()           | Tab autocompletion for files. New line after enter.                         |
| string readList(string[] list)           | User selects from a list of options, returns the chosen value.              |
| string readLineList(string[] list)       | Same as readList, but there's a new line after enter.                       |
| sting[] readCheckbox(string[] list)      | Returns array of checked lists.                                             |
| string[] readLineCheckbox(string[] list) | Same as readCheckbox, but outputs new line after enter.                     |

## [Math](#neo-c-standard-libraries)
- abs()
- sqrt()

| Trig functions  | Description |
|-----------------|-------------|
| f64 cos(f64 x)  |             |
| f64 sin(f64 x)  |             |
| f64 tan(f64 x)  |             |
| f64 acos(f64 x) |             |
| f64 asin(f64 x) |             |
| f64 atan(f64 x) |             |

## [File](#neo-c-standard-libraries)
- File
  - getFile(string fileName)

## [Time](#neo-c-standard-libraries)
  - currentTime()
  - Date functions as well

## [HTML](#neo-c-standard-libraries)
- Functions that allow you to interact with HTML

## [Regex](#neo-c-standard-libraries)

## [Network](#neo-c-standard-libraries)
- fetch, json, express like server

## [Encrypt](#neo-c-standard-libraries)
- sha256
- cryptographic encryption
- rsa
- other common encryption algorithms
- UUID

## [LinkedList](#neo-c-standard-libraries)
## [Test](#neo-c-standard-libraries)
- Library for test driven development.
## [Bash](#neo-c-standard-libraries)
Library for running bash commands

## [Convert](#neo-c-standard-libraries)
- Convert
  - string typeof(T value)

## [Error](#neo-c-standard-libraries)
- exit()
- Different error types
	- OutOfRange

## [Arguments](#neo-c-standard-libraries)
A library for handling args when the compiled program is called from the terminal

## [Draw](#neo-c-standard-libraries)
- Pen functions

## [ML](#neo-c-standard-libraries)
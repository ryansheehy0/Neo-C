# Neo-C Standard Libraries

**Not Done**

<!-- TOC -->

- [Console](#console)
- [Math](#math)
- [File](#file)
- [Time](#time)
- [HTML](#html)
- [Regex](#regex)
- [Network](#network)
- [Encrypt](#encrypt)
- [DataStructure](#datastructure)
- [Test](#test)
- [Bash](#bash)
- [Error](#error)
- [Draw](#draw)
- [MachineLearning](#machinelearning)
- [Optional](#optional)

<!-- /TOC -->

## Console
The Console library is used to interact with the console.

void print(string msg, string end = "\n")
How to print arrays? Spread operator?
  - Convert array to string. (string)array

void print(string msg, string end = "\n")
void printError(string msg, string end = "\n")
void setTextColor(Color c)
void resetTextColor()

string userInput(string msg = "", bool hidden = false, bool tabCompletion = false)


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

- Need a way to navigate arguments from the console.
  - Like flags

## Math
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

## File
- File
  - getFile(string fileName)

## Time
  - currentTime()
  - Date functions as well

## HTML
- Functions that allow you to interact with HTML and CSS

## Regex

## Network
- fetch, json, express like server

## Encrypt
- sha256
- cryptographic encryption
- rsa
- other common encryption algorithms
- UUID
- rand()
  - Returns a f64 between 0 and 1. Cryptographically secure.

## DataStructure
- Linked List
- set
- map

## Test
- Library for test driven development.
- Automatic checks
- Only fails are printed

## Bash
Library for running bash commands

## Error
- exit()
- Different error types
	- OutOfRange

## Draw
- Pen functions

## MachineLearning

## Optional
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

<!-- /TOC -->

## [Terminal](#neo-c-standard-libraries)
The Terminal library is used to interact with the terminal.

- void print(string msg)
- void printLine(string msg)
  - Automatically adds a new line to the end.
- void printError(string msg)
- void printLineError(string msg)
- string getLine()
  - Waits for the user to enter a line in the terminal. When enter is pressed the function returns. It doesn't return the new line from the enter. The new line from the enter is still register.
  - Doesn't return the new line in the string.
  - The new line does get output to the terminal.

- When pressing enter, new line displayed to the terminal or not.
- When pressing enter, your input is displayed to the terminal or not.
- When typing your input is being shown or not.
- Tab autocompletion or not

- string getInput()
  - When the user presses enter, a new line isn't displade to the terminal.
  - Gets user input. When the user presses enter that isn't output to the terminal.
- getLinePassword()
- getLineTabCompletion()
- getList(string[] value)

## [Math](#neo-c-standard-libraries)
- abs()
- sqrt()

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

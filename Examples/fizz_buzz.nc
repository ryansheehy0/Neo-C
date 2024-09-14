import {printLine, printLineError} <Terminal>

i32 main(string[] args)
	if args.size() != 2
		printLineError("The argument is the number of iterations.\nfizzBuzz numOfIterations")
		return 1
	for i64 i = 0; i < (i64)args[1]; i++
		if i % 3 == 0 && i % 5 == 0
			printLine("FizzBuzz")
		else if i % 3 == 0
			printLine("Fizz")
		else if i % 5 == 0
			printLine("Buzz")
		else
			printLine(i)
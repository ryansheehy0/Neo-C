import {printLine, printLineError} <Terminal>
import {OutOfRange} <Error>

i32 main(string[] args)
	if args.size() != 2
		printLineError("The argument is the number of iterations.\nfizzBuzz numOfIterations")
		return 1

	try u64 numOfIterations = u64(args[1])
	catch OutOfRange error
		printLineError("numOfIterations needs to be a postive integer.")
		return 1

	for u64 i = 0; i < numOfIterations; i++
		if i % 3 == 0 && i % 5 == 0
			printLine("FizzBuzz")
		else if i % 3 == 0
			printLine("Fizz")
		else if i % 5 == 0
			printLine("Buzz")
		else
			printLine(i)
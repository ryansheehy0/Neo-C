import
	(print, printError) <Console>
	(OutOfRange) <Error>

void main(string[] args)
	if (args.size() != 2)
		printError("The argument is the number of iterations.\nfizzBuzz numOfIterations")
		exit(1)

	try u64 numOfIterations = u64(args[1])
	catch (OutOfRange error)
		printError("numOfIterations needs to be a positive integer.")
		exit(1)

	for (u64 i = 0; i < numOfIterations; i++)
		if (i % 3 == 0 && i % 5 == 0)
			print("FizzBuzz")
		else if (i % 3 == 0)
			print("Fizz")
		else if (i % 5 == 0)
			print("Buzz")
		else
			print(string(i))
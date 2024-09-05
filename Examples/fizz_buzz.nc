import {print, printError} <Terminal>
import {toI64} <Convert>

i32 main(string[dynamic] args)
	if args.size() != 2
		printError("The argument is the number of iterations.\nfizzBuzz numOfIterations\n")
		return 1
	for i64 i = 0; i < toI64(args[1]); i++
		if i % 3 == 0 && i % 5 == 0
			print("FizzBuzz\n")
		else if i % 3 == 0
			print("Fizz\n")
		else if i % 5 == 0
			print("Buzz\n")
		else
			print("${i}\n")
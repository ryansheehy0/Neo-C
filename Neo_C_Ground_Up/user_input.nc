import {print, printError} <Terminal>

u64 main(string[dynamic] args)
	if args.size() != 2
		printError("Need 2 arguments.\n")
		return 1
	print("This is your argument: ${args[1]}")
	return 0
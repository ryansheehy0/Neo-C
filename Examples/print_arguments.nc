import
	(print) <Terminal>

i32 main(string[] args)
	for (string arg, u64 i in args)
		print("Argument ${i}: ${arg}")
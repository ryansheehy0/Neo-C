import
	(print, userInput) <Terminal>
	(rand) <Encrypt>
	(OutOfRange) <Error>

i32 main()
	i8 randNum = (rand() * 99) + 1
	i64 numOfGuesses = 0
	while (true)
		try i8 guess = i8(userInput("Guess a number between 1 and 100: "))
		catch (OutOfRange e)
			print("I didn't understand")
			continue
		numOfGuesses++
		if (guess == randNum)
			print("  ${guess} is the answer!")
			print("Finished in ${numOfGuesses} ${numOfGuesses == 1 ? "guess" : "guesses"}")
			return 0
		else if (guess < randNum)
			print("  ${guess} is too low")
		else
			print("  ${guess} is too high")
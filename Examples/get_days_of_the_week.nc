import {userInput, print, printLine} <Terminal>
import {OutOfRange} <Error>

i32 main()
	enum DayOfTheWeek {MON = 1, TUE, WED, THU, FRI, SAT, SUN}

	DayOfTheWeek day
	while true
		print("Enter day of the week (1-7): ")
		string userInput = userInput()
		try
			i8 intUserInput = i8(userInput)
			day = enum<DayOfTheWeek>(intUserInput)
		catch OutOfRange error
			printLine("Please make sure your input is between (1-7).")
			continue
		break

	match day
		case DayOfTheWeek.MON ... DayOfTheWeek.FRI:
			printLine("Get to work.")
		default:
			printLine("It's the weekend. Relax.")
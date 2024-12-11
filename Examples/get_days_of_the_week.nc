import
	(userInput, print) <Terminal>
	(OutOfRange) <Error>

i32 main()
	enum i8 DayOfTheWeek
		kMon = 1, kTue, kWed, kThu, kFri, kSat, kSun

	while (true)
		string ui = userInput("Enter day of the week (1-7): ")
		try DayOfTheWeek day = enum<DayOfTheWeek>(ui)
		catch (OutOfRange error)
			print("Please make sure your input is between (1-7).")
			continue
		break

	match (day)
		case (DayOfTheWeek.kMon...DayOfTheWeek.kFri)
			print("Get to work.")
		case (...)
			print("It's the weekend. Relax.")
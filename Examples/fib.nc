import {print} <Terminal>

i32 main()
	u16 x, y, z

	while true
		x = 0
		y = 1
		do while x < 255
			print(x)

			z = x + y
			x = y
			y = z
		break

/*
	Comment
	/* This is also a comment */
	Comment
*/
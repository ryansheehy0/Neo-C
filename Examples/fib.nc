import
	(print) <Console>

void main()
	u16 x, y, z
	while (true)
		x = 0
		y = 1
		do while (x < 255)
			print(string(x))
			z = x + y
			x = y
			y = z
		break
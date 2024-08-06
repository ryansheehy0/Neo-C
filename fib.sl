include <iostream>

func int main ()
	var int x
	var int y
	var int z

	while (1)
		x = 0
		y = 1
		do
			cout << x << endl

			z = x + y
			x = y
			y = z
		while (x < 255)
		break
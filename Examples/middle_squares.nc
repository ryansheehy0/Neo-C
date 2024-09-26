export class MiddleSquaresRandomNumber
	u64 _seed

	MiddleSquaresRandomNumber(u64 seed)
	init _seed(seed)

	u64 _extractMiddle(u64 squaredSeed, u64 seedLength)
		string reversedSquaredSeed = string(squaredSeed).reverse()
		string middle
		for i64 i = 0; i < seedLength + seedLength / 2; i++
			if i < seedLength / 2
				continue
			middle += reversedSquaredSeed[i]
		return middle.reverse()

	u64 _getSeedLength()
		return string(_seed).size()

	void setSeed(u64 seed)
		_seed = seed

	u64 next()
		return _extractMiddle(_seed ** 2, _getSeedLength())
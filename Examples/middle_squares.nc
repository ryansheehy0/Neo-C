import {OutOfRange} <Error>

export class MiddleSquaresRandomNumberGenerator
	u64 _seed
	u64 _seedLength

	MiddleSquaresRandomNumberGenerator(u64 seed)
	init _seed(seed), _seedLength(string(seed).size())

	u64 _extractMiddle(u64 squaredSeed)
		string reversedSquaredSeed = string(squaredSeed).reverse()
		// Extract the middle of the reversed squared seed
		string middle
		for i64 i = _seedLength / 2; i < _seedLength + _seedLength / 2; i++
			middle += reversedSquaredSeed[i]

		for i64 i = 0; i < _seedLength; i++
			middle += reversedSquaredSeed[i + _seedLength / 2]
		// return
		try u64 newSeed = u64(middle.reverse())
		catch OutOfRange error
			//
		return newSeed

	void setSeed(u64 seed)
		_seed = seed
		_seedLength = string(seed).size()

	u64 next()
		_seed = _extractMiddle(_seed ** 2)
		return _seed
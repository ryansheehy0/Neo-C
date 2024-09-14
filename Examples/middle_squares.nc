import {currentUnixTime} <Time>

export object middleSquares
	u64 _seed = currentUnixTime()

	u64 _extractMiddle(u64 squaredSeed, u64 seedLength)
		string strSquaredSeed = (string)(squaredSeed).reverse()
		string middle
		for i64 i = 0; i < seedLength + seedLength / 2; i++
			if i < seedLength / 2
				continue
			middle += strSquaredSeed[i]
		return middle.reverse()

	u64 _getSeedLength()
		string seed = (string)_seed
		return seed.size()

	void setSeed(u64 seed)
		_seed = seed

	u64 getNext()
		return _extractMiddle(_seed ** 2, _getSeedLength())
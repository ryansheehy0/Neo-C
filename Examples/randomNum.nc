import {currentUnixTime} <Time>
import {log, floor} <Math>
import {toString} <Convert>

export object randomNum
	const u64 _A = 1664525, _C = 1013904223, _M = 4294967296
	u64 _previousNum = currentTime()

	void setSeed(u64 seed)
		_previousNum = seed

	u64 get()
		_previousNum = (_A * _previousNum + _C) % _M
		return _previousNum

export object middleSquares
	u64 _seed = currentUnixTime()

	u64 _extractMiddle(u64 squaredSeed, u64 seedLength)
		string strSquaredSeed = toString(squaredSeed)
		strSquaredSeed = strSquaredSeed.reverse()
		string middle
		for i64 i = 0; i < seedLength + seedLength / 2; i++
			if i < seedLength / 2
				continue
			middle += strValue[i]
		return middle.reverse()

	u64 _getSeedLength()
		string seed = toString(_seed)
		return seed.size()

	void setSeed(u64 seed)
		_seed = seed

	u64 getNext()
		u64 seedLength = _getSeedLength()
		u64 squaredSeed = _seed ** 2
		_seed = _extractMiddle(squaredSeed, seedLength)
		return _seed
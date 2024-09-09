import {currentTime} <Time>

export object randomNum
	const u64 _A = 1664525, _C = 1013904223, _M = 4294967296
	u64 _previousNum = currentTime()

	void setSeed(u64 seed)
		_previousNum = seed

	u64 get()
		_previousNum = (_A * _previousNum + _C) % _M
		return _previousNum
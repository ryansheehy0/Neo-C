export class MiddleSquaresRandomNumberGenerator
	public
		MiddleSquaresRandomNumberGenerator(u64 seed)
			init _seed(seed), _seedLength(string(seed).size())

		void setSeed(u64 seed)
			_seed = seed
			_seedLength = string(seed).size()

		u64 next()
			_seed = extractMiddle(_seed ** 2)
			return _seed

	private
		u64 _seed
		u64 _seedLength

		u64 extractMiddle(u64 squaredSeed)
			string squaredStr = string(squaredSeed).padLeft(_seedLength * 2, '0')
			i64 start = _seedLength / 2
			string middle = squaredStr.substr(start, _seedLength)
			try u64 newSeed = u64(middle)
			catch (...) // Won't throw an error
			return newSeed
import <OutOfRange> <Error>

template <auto Type>
export class Array(Type[] _data)
	i64 size = sizeof(_data) / sizeof(_data[0])

	i64 at(i64 index) : OutOfRange
		if index > size throw OutOfRange("Index is too large.")
		if 
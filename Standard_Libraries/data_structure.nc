import
	(print) <Console>

template<auto T>
export class Iterator
	public
		void operator++()
		void operator*()
	private
		T* _iterator

template<auto Type>
export class DataStructure
	public
		// Algorithms
		template<This DS>
		void printAll(DS* this) const
			for (Type element in this)
				print(string(element))

		template<This DS>
		void removeAll(DS* this, Type value)
			for (Type element, i64 i in this)
				if (element == value)
					erase(i)

		template<This DS>
		i64 count(DS* this, Type value) const
			i64 count = 0
			for (Type element in this)
				if (element = value)
					count++
			return count

		template<This DS>
		void transform(DS* this, Type transformFunc(Type a))
			for (Type& element in this)
				element = transformFunc(element)

		template<This DS>
		void replace(DS* this, Type value, Type replacedValue)
			for (Type& element in this)
				if (element == value)
					element = replacedValue

		/*
		template<This DS, LessThan LT
		void sort(DS* this, LT lessThan)
		// or
		void sort(DS* this, Type lessThan(Type a, Type b))
		i64 findIndex(DS* this, Type value)
		i64 binaryFindIndex(DS* this, Type value)
		bool contains(DS* this, Type value)
		bool binaryContains(DS* this, Type value)
		void fillAll(DS* this, Type value)
		i64 minIndex(DS* this)
		i64 maxIndex(DS* this)
		bool allOf(DS* this, bool condition(Type value)) const
		bool noneOf(DS* this, bool condition(Type value)) const
		bool anyOf(DS* this, bool condition(Type value)) const
		*/

	private
	protected



template <typename T>
struct Iterator {
	T* begin;
	T* end;
};

template <typename T>
class DataStructure {
	public:
		T* begin() { return _iter.begin; }
		T* end() = { return _iter.end; }
		void operator++()

		int64_t size() const { return _size; }
		int64_t length() const { return _size; }

		virtual T& operator[](int64_t index) = 0;
		virtual const T& operator[](int64_t index) const = 0;
		virtual T& at(int64_t index) = 0;
		virtual const T& at(int64_t index) const = 0;

		virtual pushFront(const T& value) = 0;
		virtual pushBack(const T& value) = 0;

		virtual T popFront() = 0;
		virtual T popBack() = 0;

		virtual void insert(int64_t index, T value) = 0;
		virtual void erase(int64_t index) = 0;

		// Algorithms
		void print() {
			for (auto pos = )
		}

		void remove(T value) {
			int64_t i = 0;
			for (T* ptr = begin(); ptr != end(); ptr += sizeof(T), i++) {
				if (*ptr == value) {
					erase(i);
				}
			}
		}

	protected:
		int64_t _size = 0;
		Iterator<T> _iter;
};


/*
## Data Structures

- `i64 size() const` or `i64 length() const`
- `Type& at(i64 index)` and `const Type& at(i64 index) const`
    - This allows for negative array indexing. Ex: -1 gets the last element.
- `DataStructure& subArray(i64 startingIndex)` and `DataStructure& subArray(i64 startingIndex, i64 endingIndex)`
    - Returns a 

| Array, string, and dynamic array methods  | Description                                                                        |
|-------------------------------------------|------------------------------------------------------------------------------------|
| .subArr(startIndex, optional endIndex)  | Returns a sub array from startIndex to endIndex or the end of the array.           |
| .subStr(startIndex, optional endIndex) | Returns a string from startIndex to endIndex or the end of the string.             |
| .sort(optional function)                  | Returns a sorted array/string from lowest to highest.                              |
| .reverse()                                | Returns a reversed array/string.                                                   |
| .contains(value) or .includes(value)      | Does the value exist in the array?                                                 |
| .binaryContains(value) or .binaryIncludes(value)    | Uses binary search. Array/string is assumed to be sorted.                |
| .find(value)                              | Gets the index of the value.                                       |
| .binaryFind(value)                                  | Uses binary search. Array/string is assumed to be sorted.                |
| .fill(value, start, optional end)         | Fills the value from the start index to the end index or to the end of the array.  |
| .map(function)                            | Applies the function to each element of the array and returns that array.          |
| .filter(function)                         | Returns a filtered array. If the function returns true it gets filtered out.       |

- The function passed to these methods have these arguments: `func(element, optional index, optional array)`

| String and dynamic array methods            | Description                                                           |
|---------------------------------------------|-----------------------------------------------------------------------|
| .allocate(size)                             | Sets the allocated memory size.                                       |
| .allocationSize()                           | Gets the allocation size of memory.                                   |
| .push(value)                                | Pushes an element on the end.                                         |
| .pop()                                      | Removes and returns the last element on the end.                      |
| .unshift(value)                             | Puts an element on the beginning.                                     |
| .shift()                                    | Removes the first element and returns it.                             |
| .insert(index, value, optional value, etc.) | Inserts the value or values at the index.                             |
| .remove(index, optional howMany)            | Removes the element at the index and the next howMany(defaults to 1). |

| String methods | Description                                           |
|----------------|-------------------------------------------------------|
| .toUpperCase() | Converts string to upper case.                        |
| .toLowerCase() | Converts string to lower case.                        |
| .trimStart()   | Removes any white space in front of the string.       |
| .trimEnd()     | Removes any white space at the back of the string.    |
| .trim()        | Removes any white space in the front and at the back. |

- You can use `array1 + array2` or `string1 + string2` to do concatenation.
- These methods can throw errors if the index is out of range.
*/

/*
string map(char function(char element, i64 index, string array))
	string outputStr = ""
	for char el, i64 i in this->_data
		outputStr += function(el, i, this->_data)
	return outputStr

string map(char function(char element, i64 index))
	map((char element, i64 index, string array){
		function(element, index)
	})

string map(char function(char element))
	map((char element, i64 index, string array){
		function(element)
	})


void toUpper()
	for (char& character in _data)
		match (character)
			case ('a'...'z')
				character -= 32
*/
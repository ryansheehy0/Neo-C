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
		void remove(T value) {
			int64_t i = 0;
			for (T* ptr = begin(); ptr != end(); ptr += sizeof(T), i++) {
				if (*ptr == value) {
					erase(i);
				}
			}
		}

- `remove(DataStructure<T> dataStructure, T value)` - removes all the occurrences of value in data structure.

	protected:
		int64_t _size = 0;
		Iterator<T> _iter;
};
[Back](./Readme.md)

# Optional
`optional` is a built in keyword that allows you to make your type optional.

The `optional` keyword has a similar interface to this:

```C++
template<auto T>
class optional
	public
		This()
		This(const T& value)
			init _value(value), _hasValue(true)
		This(T&& value)
			init _value(value), _hasValue(true)

		void removeValue()
			_hasValue = false

		const T& value() const throws string
			if (_hasValue) return _value
			// Should throw a specific type of error
			throw "Attempted to access value when there is none."

		const T& operator=(const T& value)
			_hasValue = true
			_value = value
			return _value;

		const T& operator=(T&& value)
			_hasValue = true
			_value = value
			return _value;

		optional

	private
		bool _hasValue = false
		T _value // The compiler treats this differently to allow T to work without a default constructor
```

## Why optional is a keyword
`optional` was decided to be made a keyword instead of a library for two reasons.

1. Since it's somewhat common to want something to be optional, it is automatically included into the language.
2. To support types without a default constructor.

To support types without a default constructor, `optional` needs to allocate memory equivalent to the size of the type and assign values only when explicitly initialized. Achieving this requires low level memory manipulation that should be normally accessible to users. By making `optional` a keyword, the compiler can handle this memory management without worrying the user how it's done.

## Example

```C++
optional<i32> optInt = 10

try optInt.value()
catch (string e)
	// Value isn't set
else
	// Value is set

// or

try
	optInt.value()
	// Value is set
catch (string e)
	// Value isn't set
```
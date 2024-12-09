[Back](./Readme.md)

# Casting/Converting
In Neo-C, there is no implicit casting/converting like in C++. All castings/conversions should be called like a function.
  - Float literals have to have decimal points. Ex: `f64 x = 10.0`
  - Integer literals cannot have decimal points. Ex: `i64 x = 10`

Converting to a **bool**:

```C++
bool bool<Int || UInt || Float || Pointer || String Type>(Type value)
```

Converting to an **integer**:

```C++
i8 i8<(Int && !i8) || UInt || Float || Pointer || String Type>(Type value) : OutOfRange
```

Converting to an **unsigned integer**:

```C++
u8 u8<Int || (UInt && !u8) || Float || Pointer || String Type>(Type value) : OutOfRange
```

Converting to a **float**:

```C++
f32 f32<Int || UInt || (Float && ! f32) || Pointer || String Type>(Type value) : OutOfRange
```


- f32, f64
  - OutOfRange
- string
- arrays?
  - `ReturnType[] array<ReturnType, Type>(Type val)`
- pointers?
- class
- struct
- union
- interface
- enum
  - `Enum enum<Enum, Type>(Type val) : OutOfRange`


Data is defined in the real world. Protocols are agreed upon standards used to extract information from that data.
For example, when you drive up to a traffic light, the color and whether the lights are on or off are the data. The protocol is: red light on equals stop, yellow light on equals slow down, and green light on equals maintain speed. The information is obtained when you see the lights, apply the protocol, and extract useful information that can be translated into an action.

In programming languages, the data is the underlying bits, the protocol is the data type, and the information extracted is how that data is used by different functions. When converting you can either change the underlying bits and keep the information the same, or you can keep the underlying bits the same and possibly have the information change.

```C++
f32 a = 1.5
// Change the underlying bits
i32 b = i32(a) // 1
// Keep the underlying bits the same
i32 c = *pointer<i32*>(&a) // 1069547520
```
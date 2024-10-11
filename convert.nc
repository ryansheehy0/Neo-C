
// Bool
bool bool<Int || UInt || Float || Pointer Type>(Type value)
  if value == 0 return false
  return true

bool bool<string Type>(Type value)
  if value == "" return false
  return true

// Ints. Small changes for the other sizes
i8 i8(f32 value) : OutOfRange
  bool sign = value & 0x800000000
  u8 exponent = ((value & 0x7F800000) >> 23) - 127
  u32 mantissa = (value & ~0xFF800000)
  // Check if out of range
  return -sign * (2 ** exponent) * (1 + 


i8 i8<UInt || (Int && !i8) Type>(Type value) : OutOfRange
  const i8 UPPER_RANGE = 2 ** 7 - 1
  const i8 LOWER_RANGE = -2 ** 7 + 1
  if value > UPPER_RANGE || value < -LOWER_RANGE
    throw OutOfRange
  return *pointer<i8*>(&value)

// UInts. Small changes for the other sizes
// Float
// String

// Pointer
Type pointer<auto Type>(Type value)
  
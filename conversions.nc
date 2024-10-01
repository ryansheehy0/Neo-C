
// Bool
bool bool<Int || UInt || Float || Pointer Type>(Type value)
  if value == 0 return false
  return true

bool bool<string Type>(Type value)
  if value == "" return false
  return true

// Ints
i8 i8<Float Type>(Type value) : OutOfRange
  i8 result = 0
  bool isNegative = value < 0
  if isNegative value *= -1 // Sets value to positive
  // Counts how many times 1 can be subtracted from value before it becomes negative
  while value < 0
    value--
    result++
    if result < 0 // Checks if there's an overflow
      throw OutOfRange
  if isNegative result *= -1
  return result

i8 i8<UInt Type>(Type value) : OutOfRange
  // If the first bit of an unsigned int is 1, then it's too large for the unsigned int
  if (value << 1) == 1 throw OutOfRange
  // Convert 
  return *pointer<i8>(*value)

i8 i8<bool || (Int && !i8) || UInt Type>(Type value)

// Pointer
Type pointer<auto Type>(Type value)
  
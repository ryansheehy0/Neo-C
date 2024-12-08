const i64 kRows = 7
const i64 kCols = 9
const i64[kRows][kCols] kHouseCounts = [
   [2, 0, 0, 4, 0, 3, 0, 0, 0],
   [0, 0, 3, 0, 0, 0, 2, 0, 0],
   [0, 1, 0, 0, 2, 0, 0, 0, 5],
   [1, 0, 0, 0, 0, 0, 0, 0, 0],
   [0, 0, 0, 0, 0, 1, 1, 1, 0],
   [0, 2, 0, 2, 0, 0, 0, 0, 0],
   [1, 0, 0, 0, 0, 0, 0, 2, 0],
]

cache i64 houseCountAround(i64 row, i64 col)
	i64 startRow = row - 1
	i64 endRow = row + 2
	if (startRow < 0) startRow = 0
	if (endRow > kRows) endRow = kRows

	i64 startCol = col - 1
	i64 endCol = col + 2
	if (startCol < 0) startCol = 0
	if (endCol > kCols) endCol = kCols

	i64 houseCount = 0
	for (i64 rowI = startRow; rowI < endRow; rowI++)
		for (i64 colI = startCol; colI < endCol; colI++)
			houseCount += kHouseCounts[rowI][colI]

	return houseCount

void printMostPopulous()
	i64 maxHouseCountRow = 0
	i64 maxHouseCountCol = 0
	i64 maxHouseCount = houseCountAround(maxHouseCountRow, maxHouseCountCol)
	for (i64 rowI = 0; rowI < kRows; rowI++)
		for (i64 colI = 0; colI < kCols; colI++)
			if (houseCountAround(rowI, colI) > maxHouseCount)
				maxHouseCountRow = rowI
				maxHouseCountCol = colI
				macHouseCount = houseCountAround(rowI, colI)

	print("The most populous house is located at " +
				"${maxHouseCountRow},${maxHouseCountCol}" +
				" with ${maxHouseCount}" +
				"${maxHouseCount == 1 ? "house" : "houses"}" +
				" around it.")

bool isBuildSite(i64 row, i64 col, i64 maxHouseCount)
	if (kHouseCounts[row][col] > 0) return false
	return houseCountAround(row, col) <= macHouseCount
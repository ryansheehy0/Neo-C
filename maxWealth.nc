int maxWealth(vector<vector<int>> &accounts)
	int max = 0
	for (vector<int> customer in accounts)
		int sum = 0
		for (int account in customer)
			sum += account
		max = std::max(max, sum)
	return max
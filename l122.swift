class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buy = -1, profit = 0
        for i in 0..<prices.count {
            if i < prices.count-1 && prices[i] < prices[i+1] {
                if buy == -1 {
                    buy = i

                }
            } else if i < prices.count-1 && prices[i] > prices[i+1] {
                if buy >= 0 {
                    profit += prices[i] - prices[buy]
                    //print(profit, i, buy)
                    buy = -1
                }
            }
        }
        if buy >= 0 {
            profit += prices[prices.count-1] - prices[buy]
        }
        return profit
    }
}
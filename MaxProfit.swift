
// 121. 买卖股票的最佳时机

class Solution {
    // 方法1，暴力解法，时间复杂度O(n^2)
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0}
        var profit = 0
        for i in 0..<prices.count-1 {
            for j in (i+1)..<prices.count {
                if (prices[j] - prices[i]) > profit {
                    profit = prices[j] - prices[i]
                }
            }
        }
        return profit        
    }

    // 方法2，时间复杂度O(n)
    func maxProfit2(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0}
        var profit = 0
        var minPrice = prices[0]
        for price in prices {
            minPrice = min(minPrice, price)
            profit = max(profit, price - minPrice)
        }
        return profit
    }

}


let solution = Solution()
var result = solution.maxProfit([7,1,5,3,6,4])
print(result)
assert(result == 5)

result = solution.maxProfit2([7,1,5,3,6,4])
print(result)
assert(result == 5)


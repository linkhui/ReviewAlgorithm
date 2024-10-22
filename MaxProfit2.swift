// 122. 买卖股票的最佳时机 II
/** 给你一个整数数组 prices ，其中 prices[i] 表示某支股票第 i 天的价格。

在每一天，你可以决定是否购买和/或出售股票。你在任何时候 最多 只能持有 一股 股票。你也可以先购买，然后在 同一天 出售。

返回 你能获得的 最大 利润 。


*/
class Solution {
    // 因为可以多次买卖，所以只要后一天的价格比前一天的价格高，就可以卖出
    // 时间复杂度O(n)
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 1 else { return 0}
        var profit = 0
        for i in 1..<prices.count {
            if prices[i] > prices[i-1] {
                profit += prices[i] - prices[i-1]
                print("Day \(i): Buy at \(prices[i-1]), sell at \(prices[i]), profit: \(prices[i] - prices[i-1]), total profit: \(profit)")
            } else {
                print("Day \(i): No transaction, price decreased from \(prices[i-1]) to \(prices[i])")
            }
        }
        print("Final profit: \(profit)")
        return profit
    }
}

let solution = Solution()
var result = solution.maxProfit([7,1,5,3,8,10])
print(result)
assert(result == 11)

result = solution.maxProfit([1,2,3,4,5])
print(result)
assert(result == 4)

result = solution.maxProfit([7,6,4,3,1])
print(result)
assert(result == 0)


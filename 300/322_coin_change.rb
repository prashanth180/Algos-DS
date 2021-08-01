# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
# Using backtracking, time limti issue
# def coin_change(coins, amount)
#   dp = {}
#   coins.sort!
#   memo(dp, amount, amount, 0, coins)
#   return dp[amount] || -1
# end

# def memo(dp, remaining_amt, amount, count, coins)
#   dp[amount-remaining_amt] = count if (!dp[amount-remaining_amt] || count<dp[amount-remaining_amt])
#   if dp[amount]
#     return
#   end
#   if remaining_amt<0
#     return
#   end
#   (coins.length-1).downto(0).each do |i|
#     if (remaining_amt)%coins[i] == 0
#       cnt = (remaining_amt)/coins[i]
#       memo(dp, (remaining_amt-(cnt*coins[i])), amount, count+cnt, coins)
#     else
#       rem = remaining_amt/coins[i]
#       rem.downto(1) do |cnt|
#         memo(dp, (remaining_amt-(cnt*coins[i])), amount, count+cnt, coins)
#       end
#     end
#   end
# end


# def coin_change(coins, amount)
#   # coins.sort!
#   dp = Array.new(coins.length+1, Array.new(amount+1, Float::INFINITY))
#   # print dp
#   # puts ""
#   for i in 0..(coins.length)
#     for j in 0..(dp[i].length-1)
#       if (i==0 || j==0)
#         dp[i][j] = 0
#       else
#         # j=1, i =1
#         multiple = multiples(j, coins, i, dp, j)
#         # puts "AFTER MULTIPLES=> #{multiple}"
#         if dp[i-1][j]>0
#           dp[i][j] = [dp[i-1][j], multiple].min
#         else
#           # puts "i = #{i}, j =#{j}"
#           dp[i][j] = multiple
#         end 
#         # print dp
#       end
#     end
#   end
#   return dp[-1][-1] == Float::INFINITY ? -1 : dp[-1][-1]
# end

# def multiples(present_amt, coins, pos, dp, dp_pos)
#   # puts "--------------------------------------------"
#   # puts "MULTIPLES"
#   # puts "#{present_amt}, #{coins}, #{pos}, #{dp}, #{dp_pos}"
#   count = 0
#   count = present_amt/coins[pos-1]
#   present_amt = present_amt%coins[pos-1]
#   if present_amt==0 
#     return count
#   else
#     if pos-1>=1 && dp[pos-1][present_amt]<Float::INFINITY
#       count += dp[pos-1][present_amt]
#       return count
#     else
#       return Float::INFINITY
#     end
#   end
# end


def coin_change(coins, amount)
  return 0 if amount == 0
  return -1 if amount<coins.min
  
  dp ={}
  memo(amount, amount, coins, 0, dp )
  return dp[amount].nil? ? -1 : dp[amount]
end

def memo(amount, remaining_amt, coins, count, dp )
  return if remaining_amt<0
  used_amt = amount-remaining_amt
  if remaining_amt == 0
    dp[amount] = [dp[amount].nil? ? 99999999 : dp[amount], count].min
    return 
  elsif dp[remaining_amt]
    dp[amount] = [dp[amount].nil? ? 99999999 : dp[amount], dp[remaining_amt]+count].min
  else
    dp[used_amt] = [dp[used_amt].nil? ? 99999999 : dp[used_amt], count].min
  end
  coins.each do |coin|
     memo(amount, remaining_amt-coin, coins, count+1,dp) if remaining_amt>=coin
  end
end


def coin_change(coins, amount)
  dp = Array.new(amount+1, 10**4)
  dp[0] = 0
  1.upto(amount) do |amt|
    coins.each do |coin|
      dp[amt] = [dp[amt], dp[amt-coin]+1].min if ((amt-coin) >= 0)
    end
  end
  return -1 if dp[amount] == 10**4
  return dp[amount]
end

# 11
# 10,9,6
# 9,8,5|8,7,4|5,4,1
#           11
#       /1  |2  \5
#      10   9   6
# /1  |2  \5
# 9   8   5


coins = [1,2,5]
amount = 11
puts "COINS=#{coins}, amt = #{amount}"
puts coin_change(coins,amount)

coins = [2]
amount = 3
puts "COINS=#{coins}, amt = #{amount}"
puts coin_change(coins,amount)

coins = [1]
amount = 0
puts "COINS=#{coins}, amt = #{amount}"
puts coin_change(coins,amount)

coins = [1]
amount = 1
puts "COINS=#{coins}, amt = #{amount}"
puts coin_change(coins,amount)

coins = [1]
amount = 2
puts "COINS=#{coins}, amt = #{amount}"
puts coin_change(coins,amount)

coins=[9,6,5,1]
amount = 11
puts "COINS=#{coins}, amt = #{amount}"
puts coin_change(coins,amount)

coins = [2, 3, 6, 7]
amount = 12
puts "COINS=#{coins}, amt = #{amount}"
puts coin_change(coins,amount)

coins=[186,419,83,408]
amount = 6249
puts "COINS=#{coins}, amt = #{amount}"
puts coin_change(coins,amount)

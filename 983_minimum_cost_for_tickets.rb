# days=[1,4,6,7,8,20]
# [2,7,15]
# 11

# days=[1,2,3,4,5,6,7,8,9,10,30,31]
# [2,7,15]
# 17

# days=[4,6,7,8,20]
# [2,7,15]
# 9

# @param {Integer[]} days
# @param {Integer[]} costs
# @return {Integer}
def mincost_tickets(days, costs)
  max = 3660000
  # 1 represents costs days[0], 2 ->days[1] ...
  dp = Array.new(days[-1]+1, max)
  dp[0] = 0
  day_set = Set.new(days)
  (1).upto(dp.length-1) do |day|
    unless day_set.include?(day)
      dp[day] = dp[day-1]
    else
      #checks if day falls between min value to its day range(1,7,30)
      d_1 = day-1>=0 ? dp[day-1] : 0
      d_7 = day-7>=0 ? dp[day-7] : 0
      d_30 = day-30>=0 ? dp[day-30] : 0

      dp[day] = [d_1+costs[0], d_7+costs[1], d_30+costs[2]].min
    end
  end
  return dp[-1]
end

# days=[4,6,7,8,20]
# costs=[2,7,15]
# 9
# max_day=-1
# if max_day>0 && present_day>max_day
#   max_day = present_day + cost_map_key#either of 1,7,30
#   dp[present_day] = 
# end
# for 1 day  
#   dp[index][4] = 2
#   dp[6] = 4
#   dp[7] = 6
#   dp[8] = 10
#   dp[20] = 12

# for 7 day
#   dp[4] = 2
#   dp[6] = 4
#   dp[7] = 6 [6,7].min
#   dp[8] = 7 [10,7].min (4-7 is less than 7 days), store 11(4+7)[last_max], >=12 must work
#   dp[20] = 9 [12,7+2].min ->9

# for 15 day
#   dp[4] = 2
#   dp[6] = 4
#   dp[7] = 6
#   dp[8] = 7
#   dp[20] = 9


days=[1,4,6,7,8,20]
costs=[2,7,15]
# 11
puts mincost_tickets(days, costs)

days=[1,2,3,4,5,6,7,8,9,10,30,31]
costs=[2,7,15]
# 17
puts mincost_tickets(days, costs)

days=[4,6,7,8,20]
costs=[2,7,15]
# 9
puts "THISSS------------->"
puts mincost_tickets(days, costs)


days=[1,4,6,7,8,20]
costs=[7,2,15]
#6
puts "pppppp dummm dumm dumm------------->"
puts mincost_tickets(days, costs)
[7,14,21,28,35,42]
[2,2,2,2,4,6]
# dp[1] = 2
# dp[2] = 4
# dp[3] = 6
# dp[4] = 8
# dp[5] = 10
# dp[6] = 12
# dp[7] = 7<=[14,7].min
# dp[8] = 9<=16,9
# dp[9]= 

# [1,7,30]
# days = [1,2,3,4,5,6,7,8,9,10,30,31], costs = [2,7,15]
# 2,2,2,2,2,2,2,2,2,2,2,2
# 7,7,7

# [1,7,30]
#                             0
#        /2.                  |7.                   \15
#       [1,2]                [7,7]                [30,15]
# /1/    |7|  \30\      /1/    |7|  \30\
# [2,4][8,9][31,17]    [8,9] [14,14] [37,22]

# start with min number from days
# 1/7|\30


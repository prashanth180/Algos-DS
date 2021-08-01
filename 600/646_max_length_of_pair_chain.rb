# @param {Integer[][]} pairs
# @return {Integer}
require 'set'
def find_longest_chain(pairs)
  pair_map ={}
  pairs.each do |pair|
    if pair_map[pair[1]]
      pair_map[pair[1]] << pair
    else
      pair_map[pair[1]] = Set.new([pair])
    end
  end
  dp = Array.new(2001, 0)
  max = 0
  (-1000).upto(999) do |pt|
    if pair_map[pt]
      pair_map[pt].each do |pair|
        dp[pair[1]] = [dp[pair[1]],dp[pair[0]-1]+1].max
      end
      max = [max,dp[pt]].max
    else
      dp[pt] = max
    end
  end
  return max
end

pairs = [[1,2],[2,3],[3,4]]
puts find_longest_chain(pairs)
pairs = [[1,2],[7,8],[4,5]]
puts find_longest_chain(pairs)
paris = [[9,10],[9,10],[4,5],[-9,-3],[-9,1],[0,3],[6,10],[-5,-4],[-7,-6]]
#5
puts find_longest_chain(pairs)
# {-3=>#<Set: {[-9, -3]}>, 
# 1=>#<Set: {[-9, 1]}>, 
# -6=>#<Set: {[-7, -6]}>, 
# -4=>#<Set: {[-5, -4]}>, 
# 3=>#<Set: {[0, 3]}>, 
# 5=>#<Set: {[4, 5]}>, 
# 10=>#<Set: {[6, 10], [9, 10]}>}
# dp[-7]=0
# dp[-6] = [dp[-6],d[-7]+1] = 1
# dp[-5] = 1,
# dp[-4] = [dp[-4],dp[-5]+1].max = 2
# dp[-3] = [dp[-3],dp[-9]+1].max = [1,1].max = 1
# dp[-2..0] = 3
# dp[1] = 
# {2:[[1,2]], - 1002=>1, 1003=>1
# 4:[[1,4],[2,4],[3,4]],1004=>2
# 5:[[4,5]],1005=>1+1=>2
# 8:[[7,8]]}1008=>

# [1,2],[4,5],[7,8]
# dp[1002] = [dp[10002], dp[1000+1-1]+1].max
# dp[1002] = 1

# dp[1005] = [dp[1005], dp[1003]+1]
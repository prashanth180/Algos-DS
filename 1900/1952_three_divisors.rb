# @param {Integer} n
# @return {Boolean}
# https://leetcode.com/problems/three-divisors/
def is_three(n)
  return false if n<4
  count = 2
  max = (n/2).ceil
  2.upto(max) do |num|
    count+=1 if n%num == 0
    return false if count >3
  end
  return true if count == 3
  return false
end
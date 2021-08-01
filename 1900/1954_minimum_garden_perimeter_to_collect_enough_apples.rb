# https://leetcode.com/problems/minimum-garden-perimeter-to-collect-enough-apples/
# MY ARTICLE-> https://leetcode.com/problems/minimum-garden-perimeter-to-collect-enough-apples/discuss/1376297/RUBY-DP-%2B-Math-O(n)-complete-thought-process-explained
# @param {Integer} needed_apples
# @return {Integer}
def minimum_perimeter(needed_apples)
  memo_area = [0]
  distance=0#centre to top
  total_apples=0
  while(total_apples<needed_apples)
    distance+=1
    total_apples = increased_area(distance)+memo_area[-1]
    memo_area << total_apples
    
  end
  return distance*2*4
end

def increased_area(distance)
  return 4*3*(distance**2)
end

# https://leetcode.com/problems/two-sum/
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  #    O(N) lesser time compare to each iterator
    num_map = {}
    for i in 0..nums.length-1
      if num_map[target-nums[i]]
        return [num_map[target-nums[i]], i]
      else
        num_map[nums[i]] = i
      end
    end
    # O(N) time
    # num_map = {}
    # nums.each_with_index do |num, index|
    #   if num_map[target-num]
    #     return [num_map[target-num], index]
    #   else
    #     num_map[num] = index
    #   end
    # end
    
    # O(2N +NLogN) passes all tests
    # nums_map ={}
    # nums.each_with_index do |num, index|
    #   if nums_map[num]
    #     nums_map[num] << index
    #   else
    #     nums_map[num] = [index]
    #   end
    # end
    # nums.sort!
    # i = 0
    # j = nums.length-1
    # while(i<j)
    #   sum = nums[i]+nums[j]
    #   if sum == target
    #     if nums[i] == nums[j]
    #       return [nums_map[nums[i]][0], nums_map[nums[i]][1]]
    #     else
    #       return [nums_map[nums[i]][0], nums_map[nums[j]][0]]
    #     end
    #   elsif sum > target
    #     j-=1
    #   else
    #     i+=1
    #   end
    # end
    
  #   O(2N), passes all tests
    # hash = {}
    # nums.each_with_index do |num, index|
    #   if hash[num]
    #     hash[num] = hash[num] + [index]
    #   else
    #     hash[num] = [index]
    #   end
    # end
    # result = []
    # for i in 0...(nums.length-1)
    #   if (indexes=hash[target-nums[i]])
    #     result << indexes.select {|index| return [i,index] if index>i}
    #   end
    # end
    # return result
  end

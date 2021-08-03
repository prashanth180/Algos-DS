https://leetcode.com/problems/subsets-ii/
# @param {Integer[]} nums
# @return {Integer[][]}
# def subsets_with_dup(nums)
#   nums.sort!
#   subsets = Set.new()
#   # [1,2,2]
#   (nums.length-1).downto(0) do |i|
#     new_subsets = [[nums[i]]]#[2]
#     subsets.each do |subset|
#       new_subsets << ([nums[i]]+subset.to_a)
#     end
#     subsets = subsets + new_subsets
#   end
#   subsets  << []
#   return subsets.to_a
# end

def subsets_with_dup(nums)
  nums.sort!
  subsets = Set.new()
  # [1,2,2]
  for i in 0..(nums.length-1)
    new_subsets = [[nums[i]]]#[2]
    subsets.each do |subset|
      new_subsets << (subset.to_a+[nums[i]])
    end
    subsets = subsets + new_subsets
  end
  subsets  << []
  return subsets.to_a
end

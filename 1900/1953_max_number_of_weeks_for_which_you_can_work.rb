# @param {Integer[]} milestones
# @return {Integer}
# https://leetcode.com/problems/maximum-number-of-weeks-for-which-you-can-work/
def number_of_weeks(milestones)
  return 1 if milestones.length == 1
  milestones.sort!
  maxes = []#5,5
  max = milestones.sum
  len = milestones.length - 1
  #[1,2,5,5]
  len.downto(0) do |j|
    if j==0
      maxes<<milestones[j]    
    elsif j<milestones.length-1 && milestones[j]==milestones[j+1]
      maxes<<milestones[j]
    else
      max -= milestones[j]
      if max>=milestones[j] || (maxes.length>0 && milestones[j]<maxes.max)
        maxes<<milestones[j]
      else
        maxes << max+1 
      end
    end
  end
  return maxes.sum
end
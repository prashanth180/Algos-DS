# https://leetcode.com/problems/n-ary-tree-level-order-traversal/
# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {List[List[int]]}
def levelOrder(root)
  if root.nil?
    return []
  end
  queue = [-1, root]
  result = []
  arr = []
  while(!queue.empty?)
    ele = queue.pop#dequeue
    if ele == -1
      result << arr
      arr = []
      queue.insert(0, -1) if queue.length>0
    else
      arr << ele.val
      ele.children.each do |child|
        queue.insert(0, child) unless child.nil?
      end
    end
  end
  return result
end

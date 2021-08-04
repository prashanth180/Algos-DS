# https://leetcode.com/problems/count-complete-tree-nodes/
# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def count_nodes(root)
  total = [0]
  count_node(root, total)
  return total[0]
end

def count_node(node, total)
  return if node == nil
  total[0] = total[0] + 1
  count_node(node.left, total)
  count_node(node.right, total)
end
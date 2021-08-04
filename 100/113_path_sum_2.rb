# https://leetcode.com/problems/path-sum-ii/
def path_sum(root, target_sum)
  success_paths = []
  return success_paths if root.nil?
  dfs(root, target_sum, root.val, [root.val], success_paths)
  return success_paths
end

def dfs(root, target_sum, sum, path, success_paths)
  return if root.nil?    
  success_paths << path if root.left.nil? && root.right.nil? && sum == target_sum

  dfs(root.left, target_sum, sum+root.left.val, path+[root.left.val], success_paths) if root.left
  dfs(root.right, target_sum, sum+root.right.val, path+[root.right.val], success_paths) if root.right

end
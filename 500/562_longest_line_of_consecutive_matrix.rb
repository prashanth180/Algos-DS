# https://leetcode.com/problems/longest-line-of-consecutive-one-in-matrix/
# @param {Integer[][]} mat
# @return {Integer}
def longest_line(mat)
  possibles = [[0,-1],[-1,0],[-1,-1],[-1,1]]
  #will store possible line paths line length
  dp = {}
  max_rows = mat.length
  max_cols = mat[0].length
  max = 0
  for i in 0..mat.length-1
    for j in 0..mat[i].length-1
      if mat[i][j] == 1
        dp[[i,j]] = {0=>1, 1=>1, 2=>1, 3=>1}
        possibles.each_with_index do |prob, index|
          key = [i+prob[0],j+prob[1]]
          if dp[key]
            dp[[i,j]][index]= dp[[i,j]][index] + dp[key][index]
            # print dp[[i,j]][index]
            max = [max, dp[[i,j]][index]].max
          elsif max == 0
            max = 1
          end
        end
      end
    end
  end
  return max
end
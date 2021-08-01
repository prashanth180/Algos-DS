# @param {Integer[][]} grid
# @return {Integer}
SUB_COORDS = [[1, 0], [-1, 0], [0, 1], [0, -1]]
def largest_island(grid)
  max_area = 0
  color = 10
  group_map = {0=>0}
  n = grid.length
  # grid has either all 1's or atleast one 0 adjacent to 1
  for i in 0..n-1
    for j in 0..n-1
      if grid[i][j] == 1
        size = dfs(grid, i, j, color)
        group_map[color] = size
        color+=1
        max_area = [max_area, size].max
      end
    end
  end
  
  visited = Set.new([])
  for i in 0..n-1
    for j in 0..n-1
      if grid[i][j] == 0
        color_map = color_map(i,j, grid)
        unless visited.include?(color_map)
          result = 1
          color_map.each do |color, value|
            result += group_map[color]
          end
          max_area = [max_area, result].max
          visited << color_map
        end
      end
    end
  end
  # return grid.length**2 unless has_zero # for all 1's
  return max_area
end
  
def color_map(i,j, grid)
  color_map = {}
  SUB_COORDS.each do |sub_coord|
    x = i + sub_coord[0]
    y = j + sub_coord[1]
    if x>=0 && x<grid.length && y>=0 && y<grid.length && grid[x][y]!=0
      color_map[grid[x][y]] = true
    end
  end
  return color_map
end

def dfs(grid, i, j, color)
  if i<0 || i>=grid.length || j<0 || j>=grid.length || grid[i][j] != 1
    return 0
  end
  grid[i][j] = color
  return 1 + dfs(grid, i-1, j, color) + dfs(grid, i, j+1, color) + dfs(grid, i+1, j, color) + dfs(grid, i, j-1, color)
end

# [[0]]
# [[1,0],[0,1]]
# [[0,1,0],[1,0,1],[0,1,0]]

# https://leetcode.com/problems/stone-game/
# @param {Integer[]} piles
# @return {Boolean}
def stone_game(piles)
  ans = [false]
  alex_wins?(piles, 0, 0, ans)
  return ans[0]
end

def alex_wins?(piles, alex, lee, ans)
  # alex could have taken lees math and lee could have taken alex's path
  if piles.length == 0 && alex >lee || lee>alex
    ans[0] = ans[0] || true
    return
  end
  if piles.length>0 && !ans[0]
    alex_wins?(piles[2...piles.length], alex+piles[0], lee+piles[1],ans)
    alex_wins?(piles[1...piles.length-1], alex+piles[-1], lee+piles[0],ans)
  end
end
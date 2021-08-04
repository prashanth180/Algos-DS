# https://leetcode.com/problems/backspace-string-compare/
# @param {String} s
# @param {String} t
# @return {Boolean}
def backspace_compare(s, t)

  s=backspaced_string(s)
  t=backspaced_string(t)
  s==t
end

def backspaced_string(str)
  right = str.size-1
  backspace = 0
  while(right >=0)
    if str[right] == '#'
      backspace += 1
      str = str[0...right]+str[right+1...str.size]
      right=right-1
    else
      if backspace>0
        while(right >=0 && backspace>0 && str[right]!='#')
          str = str[0...right]+str[right+1...str.size]
          backspace -= 1
          right=right-1
        end
      else
        right=right-1
      end
    end
  end
  return str
end
# @param {String} s
# @return {Integer}
require 'set'
def min_cut(s)
  return 0 if s.length==1 || is_palindrome?(s)
  dp= {}
  dp[s] = false

  #there will be atleast one palindrom
  remaining_ones = Set.new([s])
  level = 0
  loop do
    substrs = remaining_ones
    remaining_ones = Set.new([])
    # print "\nfor level => #{level}"
    # print substrs
    # print "\n"
    substrs.each do |sub_str|
      for i in 0..sub_str.length-2
        sub_1 = sub_str[0..i]
        sub_2 = sub_str[i+1..s.length-1]
        dp[sub_1] = is_palindrome?(sub_1) if dp[sub_1].nil?
        dp[sub_2] = is_palindrome?(sub_2) if dp[sub_2].nil?
        if dp[sub_1] && dp[sub_2]
          return (level+1)
        else
          str = nil
          str = sub_2 if dp[sub_1]
          str = sub_1 if dp[sub_2]
          if str
            if remaining_ones.empty? || remaining_ones.first.length==str.length
              remaining_ones<<str 
            elsif str.length<remaining_ones.first.length
              remaining_ones = Set.new([str])
            end
          end
        end
      end
    end
    level+=1
  end
  return 0
end

# a
def is_palindrome?(sub_str)
  mid = ((sub_str.length-1)/2)
  for i in 0..mid
    return false if sub_str[i] != sub_str[sub_str.length-1-i]
  end
  return true
end

arr = ["aab","ababbbabbaba","eegiicgaeadbcfacfhifdbiehbgejcaeggcgbahfcajfhjjdgj","apjesgpsxoeiokmqmfgvjslcjukbqxpsobyhjpbgdfruqdkeiszrlmtwgfxyfostpqczidfljwfbbrflkgdvtytbgqalguewnhvvmcgxboycffopmtmhtfizxkmeftcucxpobxmelmjtuzigsxnncxpaibgpuijwhankxbplpyejxmrrjgeoevqozwdtgospohznkoyzocjlracchjqnggbfeebmuvbicbvmpuleywrpzwsihivnrwtxcukwplgtobhgxukwrdlszfaiqxwjvrgxnsveedxseeyeykarqnjrtlaliyudpacctzizcftjlunlgnfwcqqxcqikocqffsjyurzwysfjmswvhbrmshjuzsgpwyubtfbnwajuvrfhlccvfwhxfqthkcwhatktymgxostjlztwdxritygbrbibdgkezvzajizxasjnrcjwzdfvdnwwqeyumkamhzoqhnqjfzwzbixclcxqrtniznemxeahfozp"]
arr.each do |item|
  print min_cut(item)
  print "\n================\n"
end
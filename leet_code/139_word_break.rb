require 'byebug'

# Given a string s and a dictionary of words dict, determine if s can be segmented into a space-separated sequence of one or more dictionary words.
#
# For example, given
# s = "leetcode",
# dict = ["leet", "code"].
#
# Return true because "leetcode" can be segmented as "leet code".


def word_break(s, word_dict, rem_word='')
  if word_dict.include?(s)
    if rem_word == ''
      return true
    else
      word_break(rem_word, word_dict)
    end
  else
    rem_word = s[-1] + rem_word unless s[-1] == nil
    word_break(s[0,s.length - 1], word_dict, rem_word)
  end
end

p word_break("abcd",["a","abc","b","cd"])
p true

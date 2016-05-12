require 'byebug'

def max_product(words)
  letter_hash = create_letter_hash(words)
  max_product = 0
  words.each_with_index do |word, idx|
    possible_combos = words - [word]
    word.length.times do |letter_idx|
      possible_combos -= letter_hash[word[letter_idx]]
    end
    possible_combos.each do |possible_word|
      if word.length * possible_word.length > max_product
        max_product = (word.length * possible_word.length)
      end
    end
  end
  max_product
end

def create_letter_hash(words)
  letter_hash = Hash.new { |letter,words| letter[words] = [] }
  words.each do |word|
    word.length.times do |letter_idx|
      letter_hash[word[letter_idx]] << word
    end
  end
  letter_hash
end

p max_product(["abcw", "baz", "foo", "bar", "xtfn", "abcdef"])

# store each word in a hash of letters
# iterate through first word and for each letter, eliminate what other words cant wort
# multiply longest
# iterate through each one

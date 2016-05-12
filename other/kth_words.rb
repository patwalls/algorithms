def kth_words(string,k)
  words = string.split(' ')
  word_hash = Hash.new(0)

  words.each do |word|
    word_hash[word] += 1
  end

  max_word_occurence = get_max_occurence(word_hash)
  word_buckets = create_word_buckets(max_word_occurence,word_hash)

  k_words = []
  word_buckets.reverse_each do |occurence_array|
    occurence_array.each do |word|
      return k_words if k_words.length == k
      k_words.unshift(word)
    end
  end
end

def get_max_occurence(word_hash)
  max_word_occurence = 0
  word_hash.each do |key,value|
    if value > max_word_occurence
      max_word_occurence = value
    end
  end
  p max_word_occurence
  max_word_occurence
end

def create_word_buckets(max,word_hash)
  word_buckets = Array.new(max + 1,[])
  word_hash.each do |key,value|
    word_buckets[value] << key
  end
  word_buckets
end
a
p kth_words('apple orange apple orange orange peach', 2)

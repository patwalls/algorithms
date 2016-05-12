class TrieNode
	attr_accessor :letter, :children, :word_end
	def initialize(letter)
		@letter = letter
		@children = []
		@word_end = false
	end
end

class Trie
	attr_accessor :root
	def initialize
		@root = TrieNode.new(nil)
	end

	def insert(word)
		queue = word.split('')
		node = @root
		while queue.length > 0
			letter = queue.shift
			if exists_in_children(letter, node)
				node = exists_in_children(letter, node)
			else
				new_node = TrieNode.new(letter)
				node.children << new_node
				node = new_node
			end
		end
		node.word_end = true
	end

	# return node object if you can find it, if not, return nil
	def search(str)
		letter_arr = str.split('')
		node = @root
		while letter_arr.length > 0
			letter = letter_arr.shift
			if exists_in_children(letter, node)
				node = exists_in_children(letter, node)
			else
				return nil
			end
		end
		node
	end

	def search_word(word)
		node = search(word)
		node && node.word_end
	end

	def autocomplete_words(prefix)
		result_words = []
		node = self.search(prefix)
		dfs(node, prefix)
	end

	def dfs(node, prefix)
		if node.children.length == 0 
			p prefix
			return prefix
		else
			node.children.each do |child|
				dfs()
			end
		end
	end

	private

	def exists_in_children(letter, node)
		node.children.each do |child|
			if child.letter == letter
				return child
			end
		end
		return nil
	end
end

trie = Trie.new
trie.insert('the')
trie.insert('that')
trie.insert('thanks')
p trie.search_word('that')
p trie.autocomplete_words('tha')

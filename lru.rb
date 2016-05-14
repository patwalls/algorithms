class LinkedListNode
	attr_accessor :key, :next, :previous
	def initialize(key=nil)
		@key = key
		@next = nil
		@previous = nil
	end
end

class LinkedList
	attr_accessor :insert
	def initialize(capacity)
		@capacity = capacity
		@tail = LinkedListNode.new()
		@head = LinkedListNode.new()
		@head.next = @tail
		@head.previous = nil
		@tail.previous = @head
		@tail.next = nil
	end

	def insert(key)
		most_used = @head.next
		new_link = LinkedListNode.new(key)

		new_link.previous = @head
		new_link.next = most_used

		most_used.previous = new_link

		@head.next = new_link
	end

	def delete(ll_node)
		
	end


	def least_used

	end

	def pop

	end
end


class LRUCache 
	attr_accessor :key_value_store
	attr_accessor :linked_list
	attr_accessor :capacity
	attr_accessor :length
	def initialize(capacity)
		@key_value_store = {}
		@linked_list = LinkedList.new(capacity)
		@capacity = capacity
		@length = 0
	end

	def set(key, value)
		if @length < @capacity
			@length += 1 unless @key_value_store[key]
			@key_value_store[key] = value
		else
			@key_value_store[key] = value
			@key_value_store[@linked_list.least_used].delete
		end
		@linked_list.insert(key)
	end

	def get(k)
		return nil if @key_value_store[k].nil?
		@linked_list.insert(k)
		@key_value_store[k]
	end
end

a = LRUCache.new(2)
a.set('pat', 25)
p a.linked_list


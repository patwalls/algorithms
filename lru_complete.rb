class LRUCache 
	attr_accessor :key_value_store, :linked_list, :capacity, :length
	def initialize(capacity)
		@key_value_store = {}
		@linked_list = LinkedList.new(capacity, self.key_value_store)
		@capacity = capacity
		@length = 0
	end

	def set(key, value)
		ll_node = linked_list_node(key)
		if @length < @capacity
			@length += 1 unless @key_value_store[key]
			@key_value_store[key] = [value, ll_node]
		else
			@key_value_store[key] = [value, ll_node]
		end
		@linked_list.update(ll_node)
	end

	def get(key)
		return nil if @key_value_store[key].nil?
		node = @key_value_store[key][1]
		@linked_list.update(node)
		@key_value_store[key][0]
	end

	private

	def linked_list_node(key)
		if @key_value_store[key]
			linked_list_node = @key_value_store[key][1]
		else
			linked_list_node = LinkedListNode.new(nil,nil,key)
		end
		linked_list_node
	end
end

class LinkedListNode
	attr_accessor :key, :next, :prev
	def initialize(next_node,previous_node,key=nil)
		@key = key
		@next = next_node
		@prev = previous_node
	end
end

class LinkedList
	attr_accessor :update, :head
	def initialize(capacity, key_value_store)
		@capacity = capacity
		@key_value_store = key_value_store
		@length = 0
		@tail = LinkedListNode.new(nil,nil)
		@head = LinkedListNode.new(@tail,nil)
		@tail.prev = @head
	end

	def update(node)
		if node.next == nil
			remove_least_used_node if @length >= @capacity
			@length += 1
		else
			remove_existing_node(node)
		end
		insert_at_head(node)
	end

	private

	def insert_at_head(node)
		first_node = @head.next
		first_node.prev = node

		@head.next = node

		node.prev = @head
		node.next = first_node
	end

	def remove_existing_node(node)
		node_before = node.prev
		node_after = node.next
		node_before.next = node_after
		node_after.prev = node_before
	end

	def remove_least_used_node
		node_to_remove = @tail.prev
		@tail.prev.prev.next = @tail
		@tail.prev = @tail.prev.prev
		@key_value_store.delete(node_to_remove.key)
	end
end



p 'Initialize LRU Cache and set'

a = LRUCache.new(2)
a.set('pat', 25)
a.set('patrick', 35)
a.set('john', 35)
a.set('peter', 83)

p 'Tests for Linked List Original Order'
p a.linked_list.head.next.key == 'peter'
p a.linked_list.head.next.next.key == 'john'
p a.linked_list.head.next.next.next.key == nil

p 'Tests for Hash'
p a.get('peter') == 83
p a.get('john') == 35
p a.get('pat') == nil
p a.get('patrick') == nil

p 'Tests for Linked List New Order'
p a.linked_list.head.next.key == 'john'
p a.linked_list.head.next.next.key == 'peter'
p a.linked_list.head.next.next.next.key == nil

p 'Set Again'
a.set('hello',1)
a.set('world',2)
a.set('hello',5)

p 'Test Hash'
p a.get('hello') == 5
p a.get('world') == 2
p a.get('peter') == nil
p a.get('john') == nil
p a.get('hello') == 5

p 'Tests Linked List'
p a.linked_list.head.next.key == 'hello'
p a.linked_list.head.next.next.key == 'world'
p a.linked_list.head.next.next.next.key == nil



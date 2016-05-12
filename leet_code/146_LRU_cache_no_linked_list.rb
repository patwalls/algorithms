class LRUCache
    # Initialize your data structure here
    # @param {Integer} capacity
    def initialize(capacity)
        @capacity = capacity
        @lru_queue = []
        @lru_hash = Hash.new
    end

    # @param {Integer} key
    # @return {Integer}
    def get(key)
      return -1 if !@lru_hash[key]
      @lru_queue.delete_at(@lru_queue.index(key))
      @lru_queue << key
      @lru_hash[key]
    end

    # @param {Integer} key
    # @param {Integer} value
    # @return {Void}

    def set(key, value)
        if @lru_hash[key]
          @lru_queue.delete_at(@lru_queue.index(key))
        elsif @lru_queue.length == @capacity && !@lru_hash[key]
          @lru_hash.delete(@lru_queue.shift)
        end
        @lru_queue << key
        @lru_hash[key] = value
    end
end

a = LRUCache.new(3)
a.set('a',1)
a.set('b',1)
a.set('c',1)
a.set('a',2)
a.set('d',1)
b = a.get('a')
p b
p a

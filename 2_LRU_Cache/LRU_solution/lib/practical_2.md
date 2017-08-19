## Problem
This is a two part problem:
1. First, write a series of instructions on how to build out an LRU Cache (pretend
the person you're writing to has no idea how to build one. Don't forget to address
the reasoning behind using particular data structures).
2. Implement an LRU Cache from scratch with no outside references. **Don't look
at the code or instructions from your homework!**

## Solution

### Part 1
Write first part here:
1. Creating a LRU caches requires making use of two data structures. A linked list to keep track of cached items. Since LRU stands for Least Recently Used, the most recently used item will always be at the head of the linked list. However, traversal through a linked list takes linear time complexity. To help reduce the traversal time, we use a hash map to keep track of the individual nodes inside of the linked list. The key in the hash map will be the key of the node while the value will be a pointer to the node it self. This will allow us to both find, insert and delete the item in constant time.

2. Now lets talk about what happens when you try to add an item to the cache. There are two ways to proceed. First, if the item does not exist in the cache, the item is then appended to the end of the linked list and a key value pair if set inside of the hash map, where again, the key is the key of the item and the value is the pointer to the node. Second, if the item does exist in the cache (We can check by indexing the key into hash map), we can then directly remove the node from the linked list and then append it back to the start of the list. One thing to take care of however is that whenever the length of the linked list tries to go beyond that of the max limit, the last node is removed from the linked list and the key value pair from the hash map is removed to account for the change. Now for the actual implementation.

### Part 2
```ruby
class LRUCache

  def initialize(max, prc)
    @store = LinkedList.new(max)
    @map = HashMap.new
    @prc = prc
  end

  def append(key)

  end

end
```

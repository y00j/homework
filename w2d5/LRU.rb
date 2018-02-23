class LRUCache
  attr_reader :cache
   def initialize(size)
     @cache = Array.new(size)
   end

   def count
     @cache.count { |el| el != nil }
     # returns number of elements currently in cache
   end

    def add(el)
      if @cache.include?(el)
        idx = @cache.index(el)
        @cache.delete_at(idx)
        @cache << el
      else
        @cache.shift
        @cache << el
      end
     # adds element to cache according to LRU principle
    end

   def show
     p cache
     # shows the items in the cache, with the LRU item first
   end

   private
   # helper methods go here!

 end

class Stack
  def initialize
    @stack = []
    # create ivar to store stack here!
  end

  def add(el)
    @stack << el
    # adds an element to the stack
  end

  def remove
    @stack.pop
    # removes one element from the stack
  end

  def show
    @stack
    # return a copy of the stack
  end
end

class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift(el)
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue
  end
end

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    remove(key) if lookup(key)
    @map << [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair.last if pair.first == key }
    nil
  end

  def remove(key)
    @map.delete([key, lookup(key)])
  end
end

require_relative 'my_stack'

class StackQueue
  
  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
    # @store = []
  end

  def size
    @stack1.size+@stack2.size
  end

  def empty?
    @stack1.empty? && @stack2.empty?
    
  end

  def enqueue(item)
    @stack1.push(item)
    
  end

  def dequeue
    fill_stack if @stack2.empty?
      return @stack2.pop
  end
private

  def fill_stack
    @stack1.size.times { @stack2.push(@stack1.pop)}
  end
end


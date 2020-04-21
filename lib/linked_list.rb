require "./lib/node.rb"

class LinkedList
  attr_accessor :head, :tail
  
  def initialize
    @head = nil
    @tail = nil
  end

  public

  def append(value)
    new_node = create_node(value, nil)
    if empty?
      self.head = new_node
      self.tail = new_node
    else
      self.tail.next_node = new_node.data
      self.tail = new_node
    end
    puts tail
  end

  def empty?
    true if (head == nil && tail == nil)
  end

  private





  

  def create_node(value, next_node)
    Node.new({
      "data" => value,
      "next_node" => next_node
    })
  end

end

list1 = LinkedList.new
list1.append("stephen")
puts list1.head.data
puts list1.tail.data
puts " "
list1.append("regan")
puts list1.head.data
puts list1.tail.data
puts " "
list1.append("sean")
puts list1.head.data
puts list1.tail.data
puts " "




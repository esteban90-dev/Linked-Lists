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
      self.tail.next_node = new_node
      self.tail = new_node
    end
  end

  def prepend(value)
    new_node = create_node(value, nil)
    if empty?
      self.head = new_node
      self.tail = new_node
    else
      new_node.next_node = head
      self.head = new_node
    end
  end

  def size
    return 0 if empty?
    current_node = head
    sum = 1
    while current_node.next_node 
      sum += 1
      current_node = current_node.next_node
    end
    sum
  end

  def contains?(value)
    return false if empty?
    current_node = head
    result = false
    result = true if current_node.data == value
    while current_node.next_node
      current_node = current_node.next_node
      result = true if current_node.data == value
    end
    return result
  end

  def find(value)
    return nil if empty?
    current_node = head
    i = 0
    return i if current_node.data == value
    while current_node.next_node
      current_node = current_node.next_node
      i += 1
      return i if current_node.data == value
    end
    nil
  end

  def at(index)
    raise ("List is empty.") if empty?
    raise ("No node exists at position #{index} in the list.") if index >= size
    i = 0
    current_node = head
    while current_node.next_node
      break if i == index
      current_node = current_node.next_node
      i += 1
    end
    current_node
  end

  def pop
    raise ("List is empty.") if empty?
    current_node = head
    while current_node.next_node != tail
      current_node = current_node.next_node
    end
    temp = current_node.next_node
    current_node.next_node = nil
    self.tail = current_node
    temp
  end

  private

  def create_node(value, next_node)
    Node.new({
      "data" => value,
      "next_node" => next_node
    })
  end

  def empty?
    true if (head == nil && tail == nil)
  end

end





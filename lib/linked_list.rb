class LinkedList
  include Enumerable

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
    sum = 0
    self.each do |node|
      sum += 1
    end
    sum
  end

  def contains?(value)
    result = false
    return result if empty?
    self.each do |node|
      result = true if node.data == value
    end
    result
  end

  def find(value)
    return nil if empty?
    self.each_with_index do |node, index|
      return index if value == node.data
    end
    nil
  end

  def at(position)
    raise ("List is empty.") if empty?
    raise ("No node exists at position #{position} in the list.") if position >= size
    self.each_with_index do |node, index|
      return node if index == position
    end
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

  def to_s
    raise ("List is empty.") if empty?
    current_node = head
    str = ""
    while current_node.next_node
      str << "( #{current_node.data} )"
      str << " -> "
      current_node = current_node.next_node
    end
    str << "( #{current_node.data} )"
    str << " -> nil"
  end

  def each
    return self.to_enum unless block_given?
    return nil if empty?
    current_node = head
    while current_node
      yield current_node
      current_node = current_node.next_node
    end
  end

  def each_with_index
    return self.to_enum unless block_given?
    return nil if empty?
    index = 0
    current_node = head
    while current_node
      yield current_node, index
      current_node = current_node.next_node
      index += 1
    end
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





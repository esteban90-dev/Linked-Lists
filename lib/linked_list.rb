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
    return nil if empty?
    if self.size == 1
      temp = head
      self.head = nil
      self.tail = nil
    else
      temp = tail
      self.each do |node|
        if node.next_node == tail
          node.next_node = nil
          self.tail = node
        end
      end
    end
    temp
  end

  def shift
    return nil if empty?
    removed_node = head
    self.head = head.next_node
    removed_node
  end

  def to_s
    return nil if empty?
    str = ""
    self.each do |node|
      str << "( #{node.data} ) -> "
    end
    str << "nil"
  end

  def insert_at(value, position)
    if position == 0
      self.prepend(value)
    elsif position >= size
      self.append(value)
    else
      new_node = create_node(value,nil)
      self.each_with_index do |node, index|
        if index + 1 == position
          new_node.next_node = node.next_node
          node.next_node = new_node
        end
      end
    end
  end

  def remove_at(position)
    if position >= size || empty?
      return nil
    elsif position == size - 1
      removed_node = self.pop
    elsif position == 0
      removed_node = self.shift
    else
      self.each_with_index do |node, index|
        if index + 1 == position
          removed_node = node.next_node
          node.next_node = removed_node.next_node
        end
      end
    end
    removed_node
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





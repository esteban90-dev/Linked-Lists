class Node
  attr_reader :data
  attr_accessor :next_node

  def initialize(args)
    @data = args.fetch("data")
    @next_node = args.fetch("next_node")
  end
end

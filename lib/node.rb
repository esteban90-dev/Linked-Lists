class Node
  attr_reader :data, :next

  def initialize(args)
    @data = args.fetch("data")
    @next = args.fetch("next")
  end
end

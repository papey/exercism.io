class Node(T)
  include Enumerable(T)
  include Iterable(T)

  @value : T
  @left : self?
  @right : self?

  getter value : T
  getter left, right : self?

  def initialize(@value : T, @left = nil, @right = nil)
  end

  def leftmost
    left.try(&.leftmost) || value
  end

  def rightmost
    right.try(&.rightmost) || value
  end

  def insert(val : T)
    if val <= value
      @left = insert_create(@left, val)
    else
      @right = insert_create(@right, val)
    end

    self
  end

  def delete(val)
    if val == @value
      if @left
        @value = @left.as(Node).rightmost
        @left = nil if @left.try(&.delete(@value))
        false
      elsif @right
        @value = @right.as(Node).leftmost
        @right = nil if @right.try(&.delete(@value))
        false
      else
        true
      end
    elsif val < @value
      @left = nil if @left.try(&.delete(val))
      false
    else
      @right = nil if @right.try(&.delete(val))
      false
    end
  end

  def traverse(acc = [] of Node(T))
    left.try &.traverse(acc)
    acc << self
    right.try &.traverse(acc)
    acc
  end

  def each(&block)
    traverse.each do |v|
      yield v.value
    end
  end

  def each
    traverse.each.map(&.value)
  end

  def search(val : T) : self | Nil
    return self if value == val

    if val < value
      left.try(&.search(val))
    else
      right.try(&.search(val))
    end
  end

  private def insert_create(child : self?, val : T) : self
    child ? child.insert(val) : Node.new(val)
  end
end

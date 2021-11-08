class Node(T)
  include Enumerable(T)
  include Iterable(T)

  @value : T
  @left : self?
  @right : self?

  getter value
  getter left
  getter right

  def initialize(val : T)
    @value = val
    @left = nil
    @right = nil
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

  def values : Array(Int32)
    vals = [] of Int32
    if left = @left
      vals += left.values
    end

    vals += [@value]

    if right = @right
      vals += right.values
    end

    vals
  end

  def search(val : T) : self | Nil
    return self if value == val

    if val < value
      left.try(&.search(val))
    else
      right.try(&.search(val))
    end
  end

  def each(&block : Int32 -> _)
    values().each do |v|
      yield v
    end
  end

  def each : TreeIterator
    TreeIterator.new(to_a)
  end

  private def insert_create(child : self?, val : T) : self
    child ? child.insert(val) : Node.new(val)
  end
end

class TreeIterator
  include Iterator(Int32)

  def initialize(@values : Array(Int32))
    @index = -1
  end

  def next : (Int32 | Iterator::Stop)
    @index += 1
    @index < @values.size ? @values[@index] : stop
  end

  def rewind
    @index = 0
    self
  end
end

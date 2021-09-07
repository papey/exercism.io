class BoutiqueInventory
  CHEAP = 30
  private_constant :CHEAP

  private

  attr_reader :items

  def initialize(items)
    @items = items
  end

  public

  def item_names
    items.collect { |item| item[:name] }.sort
  end

  def cheap
    items.select { |item| item[:price] < CHEAP }
  end

  def out_of_stock
    items.select { |item| item[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    items.find { |item| item[:name] == name }[:quantity_by_size]
  end

  def total_stock
    items.sum { |item| item[:quantity_by_size].values.sum }
  end
end

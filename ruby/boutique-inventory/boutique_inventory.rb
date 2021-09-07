class BoutiqueInventory
  def item_names
    items.sort_by { |item| item[:name] }.collect { |item| item[:name] }
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

  private

  CHEAP = 30

  attr_reader :items

  def initialize(items)
    @items = items
  end
end

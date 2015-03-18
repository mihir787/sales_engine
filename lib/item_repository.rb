require_relative 'item'
require_relative 'file_loader'

class ItemRepository
  attr_reader :items

  def initialize(sales_engine)
    @items = []
    @sales_engine = sales_engine
  end

  def parse_data(path)
    file = FileLoader.parse(path)
    @items = file.map{|data| Item.new(data, self)}
    file.close
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end

  def all
    @items
  end

  def random
    @items.sample
  end

  def find_by_id(id)
    @items.find{|item| item.id == id}
  end

  def find_by_name(name)
    @items.find{|item| item.name == name}
  end

  def find_by_description(detail)
    @items.find{|item| item.description == detail}
  end

  def find_by_unit_price(price)
    @items.find{|item| item.unit_price == price}
  end

  def find_by_merchant_id(id)
    @items.find{|item| item.merchant_id == id}
  end

  def find_by_created_at(date)
    @items.find{|item| item.created_at == date}
  end

  def find_by_updated_at(date)
    @items.find{|item| item.updated_at == date}
  end

  def find_all_by_id(id)
    @items.find_all{|item| item.id == id}
  end

  def find_all_by_name(name)
    @items.find_all{|item| item.name == name}
  end

  def find_all_by_description(detail)
    @items.find_all{|item| item.description == detail}
  end

  def find_all_by_unit_price(price)
    @items.find_all{|item| item.unit_price == price}
  end

  def find_all_by_merchant_id(id)
    @items.find_all{|item| item.merchant_id == id}
  end

  def find_all_by_created_at(date)
    @items.find_all{|item| item.created_at == date}
  end

  def find_all_by_updated_at(date)
    @items.find_all{|item| item.updated_at == date}
  end

  def find_invoice_items(id)
    @sales_engine.item_find_invoice_items_by_item_id(id)
  end

  def find_merchant(id)
    @sales_engine.item_find_merchant_by_merchant_id(id)
  end

  def find_successful_invoice_items(id)
    find_invoice_items(id).select do |invoice_item|
      @sales_engine.successful_transactions_from_invoice_id(invoice_item.invoice_id)
    end
  end

  def find_items_sold(id)
    find_successful_invoice_items(id).inject(0) do |sum, invoice_item|
      sum + invoice_item.quantity
    end
  end

  def most_revenue(quantity)
    @items.sort_by{ |item| -item.revenue}.first(quantity)
  end

  def most_items(quantity)
    @items.sort_by{ |item| -item.number_sold }.first(quantity)
  end
end

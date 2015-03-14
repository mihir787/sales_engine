require_relative 'item'
require_relative 'file_loader'

class ItemRepository

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
    "#<#{self.class} #{customers.size} rows>"
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
    @sales_engine.find_invoice_items_by_item_id(id)
  end

  def find_merchant(id)
    @sales_engine.item_find_merchant_by_merchant_id(id)
  end

end

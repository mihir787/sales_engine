
class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def initialize(data, parent)
    @id           =     data[:id]
    @name         =     data[:name]
    @description  =     data[:description]
    @unit_price   =     data[:unit_price]
    @merchant_id  =     data[:merchant_id]
    @created_at   =     data[:created_at]
    @updated_at   =     data[:updated_at]
    @parent       =     parent
  end

  def invoice_items
    @parent.find_invoice_items(id)
  end

  def merchant
    @parent.find_merchant(merchant_id)
  end

end

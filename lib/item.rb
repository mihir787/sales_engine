require 'bigdecimal'
require 'bigdecimal/util'

class Item
  attr_reader :id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at

  def initialize(data, parent)
    @id           =     data[:id].to_i
    @name         =     data[:name]
    @description  =     data[:description]
    @unit_price   =     (data[:unit_price].to_d) / 100
    @merchant_id  =     data[:merchant_id].to_i
    @created_at   =     Date.parse(data[:created_at])
    @updated_at   =     Date.parse(data[:updated_at])
    @parent       =     parent
  end

  def invoice_items
    @parent.find_invoice_items(id)
  end

  def merchant
    @parent.find_merchant(merchant_id)
  end

end

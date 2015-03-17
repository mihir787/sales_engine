require 'date'
class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(data, parent)
    @id         =   data[:id].to_i
    @name       =   data[:name]
    @created_at =   Date.parse(data[:created_at])
    @updated_at =   Date.parse(data[:updated_at])
    @parent = parent
  end

  def items
    @parent.find_item_by_id(@id)
  end

  def invoices
    @parent.find_invoice_by_id(@id)
  end

end

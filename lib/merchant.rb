class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(data, parent)
    @id         =   data[:id]
    @name       =   data[:name]
    @created_at =   data[:created_at]
    @updated_at =   data[:updated_at]
    @parent = parent
  end

  def items
    @parent.find_item_by_id(@id)
  end

  def invoices
    @parent.find_invoice_by_id(@id)
  end

end

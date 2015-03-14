class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(data, parent)
    @id           =   data[:id]
    @customer_id  =   data[:customer_id]
    @merchant_id  =   data[:merchant_id]
    @status       =   data[:status]
    @created_at   =   data[:created_at]
    @updated_at   =   data[:updated_at]
    @parent       =   parent
  end

  def customer
    @parent.find_by_customer(@customer_id)
  end

  def transactions
    @parent.find_transactions_by_id(@id)
  end

  def invoice_items
    @parent.find_invoice_items_by_id(@id)
  end

  def merchant
    @parent.find_merchant_by_id(@id)
  end

  def items
    invoice_items.map do |invoice_item|
      invoice_item.item
    end
  end

end

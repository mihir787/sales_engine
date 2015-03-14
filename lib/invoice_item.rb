class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  def initialize(data, parent)
    @id           =   data[:id]
    @item_id      =   data[:item_id]
    @invoice_id   =   data[:invoice_id]
    @quantity     =   data[:quantity]
    @unit_price   =   data[:unit_price]
    @created_at   =   data[:created_at]
    @updated_at   =   data[:updated_at]
    @parent = parent
  end

  def invoice
    @parent.find_invoice_by_invoice_id(@invoice_id)
  end

  def item
    @parent.find_item_by_item_id(@item_id)
  end

end

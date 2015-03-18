require 'bigdecimal'
require 'bigdecimal/util'

class InvoiceItem
  attr_reader :id,
              :item_id,
              :invoice_id,
              :quantity,
              :unit_price,
              :created_at,
              :updated_at

  def initialize(data, parent)
    @id           =   data[:id].to_i
    @item_id      =   data[:item_id].to_i
    @invoice_id   =   data[:invoice_id].to_i
    @quantity     =   data[:quantity].to_i
    @unit_price   =   (data[:unit_price].to_d) / 100
    @created_at   =   Date.parse(data[:created_at])
    @updated_at   =   Date.parse(data[:updated_at])
    @parent = parent
  end

  def invoice
    @parent.find_invoice_by_invoice_id(@invoice_id)
  end

  def item
    @parent.find_item_by_item_id(@item_id)
  end

  def revenue
    @revenue ||= quantity * unit_price
  end

  def successful?
    invoice.successful?
  end

end

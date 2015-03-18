require 'bigdecimal'
require 'bigdecimal/util'
require 'date'

class Item
  attr_reader :id,
              :name,
              :description,
              :unit_price,
              :merchant_id,
              :created_at,
              :updated_at

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

  def items_invoices
    @item_invoices ||= invoice_items.map do |ii|
      ii.nil? ? [] : ii.invoice
    end.uniq
  end

  def successful_invoice_items
    invoice_items.select{|invoice_item| invoice_item.successful?}
  end

  def successful_invoices_for_not_nil
    items_invoices.select{|invoice_item| invoice_item.successful?}
  end

  def merchant
    @parent.find_merchant(merchant_id)
  end

  def best_day
    invoice_item_sales = invoice_items.max_by{ |invoice_item| invoice_item.quantity }
    invoice_item_sales.invoice.created_at
  end

  def revenue
    successful_invoice_items.reduce(0){|total,invoice_item| total + invoice_item.revenue}
  end

  def quantity_by_id
    inv_items = successful_invoices_for_not_nil.map do |invoice|
       invoice.invoice_items
     end.flatten
     inv_items.select { |inv_item| inv_item.item_id == id }
  end

  def quantity_sold
    quantity_by_id.map do |invoice_item|
      invoice_item.quantity
    end.reduce(:+)
  end

end

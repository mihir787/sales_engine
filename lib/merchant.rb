require 'date'
class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :parent

  def initialize(data, parent)
    @id         =   data[:id].to_i
    @name       =   data[:name]
    @created_at =   Date.parse(data[:created_at])
    @updated_at =   Date.parse(data[:updated_at])
    @parent     =   parent
  end

  def customers_with_pending_invoices
    failed_invoices = invoices - successful_invoices
    failed_invoices.map(&:customer)
  end

  def favorite_customer
    @customers = successful_invoices.map { |invoice| invoice.customer }
    @customers.max_by { |customer| @customers.count(customer) }
  end

  def revenue(date = nil)
    successful_invoice_items(date).map do |invoice_item|
      invoice_item.quantity * invoice_item.unit_price
    end.reduce(:+)
  end

  def items
    @parent.find_item_by_id(@id)
  end

  def invoices
    @parent.find_invoice_by_id(@id)
  end

  private

  def successful_invoice_items(date = nil)
    successful_invoices(date).map(&:invoice_items).flatten
  end

  def successful_invoices(date = nil)
    @successful_invoices ||=
    @parent.find_all_successful_invoices_by_merchant_id(id)

    if date
      @successful_invoices.select { |invoice| invoice.created_at == date }
    else
      @successful_invoices
    end

  end
end

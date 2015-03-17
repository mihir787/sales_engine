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
    @parent = parent
  end

  def find_successful_invoices_for_merchant
    @successful_invoices ||= parent.sales_engine
                                   .invoice_repository
                                   .find_all_successful_invoices
                                   .select{|invoice| invoice.merchant_id == id}
  end

  def find_successful_invoice_items
    @sucessful_invoice_items ||= find_successful_invoices_for_merchant.map do |invoice|
      invoice.invoice_items
    end.flatten
  end

  def find_failed_invoices_for_merchant
    @failed_invoices ||= parent.sales_engine
                               .invoice_repository
                               .find_all_failed_invoices
                               .select{|invoice| invoice.merchant_id == id}
  end

  def find_all_successful_invoices
    @successful_invoices ||= parent.sales_engine
                                   .invoice_repository
                                   .find_all_successful_invoices
  end

  def customers_with_pending_invoices
    pending_invoices = invoices.reject{|invoice| find_all_successful_invoices}
    pending_customer = pending_invoices.map{|invoice| invoice.customer}
  end

  def favorite_customer
    @customers = find_successful_invoices_for_merchant.map do |invoice|
      invoice.customer
    end
    @customers.max_by do |customer|
      @customers.count(customer)
    end
  end

  def invoices_by_date(date)
    find_successful_invoices_for_merchant.select do |invoice|
      invoice.created_at == date
    end
  end

  def find_successful_invoice_by_date(date)
    invoices_by_date(date).map do |invoice|
      invoice.invoice_items
    end.flatten
  end

  def revenue(date = nil)
    if date == nil
      find_successful_invoice_items.map do |invoice_item|
        invoice_item.quantity * invoice_item.unit_price
      end
    else
      find_successful_invoice_by_date(date).map do |invoice_item|
        invoice_item.quantity * invoice_item.unit_price
      end
    end.reduce(:+)
  end

  def items
    @parent.find_item_by_id(@id)
  end

  def invoices
    @parent.find_invoice_by_id(@id)
  end

end

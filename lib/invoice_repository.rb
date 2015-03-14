require_relative 'invoice'
require_relative 'file_loader'

class InvoiceRepository
  attr_reader :invoices, :sales_engine

  def initialize(sales_engine)
    @invoices = []
    @sales_engine = sales_engine
  end

  def parse_data(path)
    file = FileLoader.parse(path)
    @invoices = file.map{|data| Invoice.new(data, self)}
    file.close
  end

  def find_by_customer(id)
    @sales_engine.invoice_find_customer_by_customer_id(id)
  end

  def find_transactions_by_id(id)
    @sales_engine.invoice_find_all_transactions_by_id(id)
  end

  def find_invoice_items_by_id(id)
    @sales_engine.invoice_find_all_invoice_items_by_id(id)
  end

  def find_merchant_by_id(id)
    @sales_engine.invoice_find_merchant_by_id(id)
  end

  def all
    @invoices
  end

  def inspect
    "#<#{self.class} #{@invoices.size} rows>"
  end

  def random
    @invoices.sample
  end

  def find_by_id(id)
    @invoices.find{|invoice| invoice.id == id}
  end

  def find_by_customer_id(id)
    @invoices.find{|invoice| invoice.customer_id == id}
  end

  def find_by_merchant_id(id)
    @invoices.find{|invoice| invoice.merchant_id == id}
  end

  def find_by_status(stat)
    @invoices.find{|invoice| invoice.status == stat}
  end

  def find_by_created_at(date)
    @invoices.find{|invoice| invoice.created_at == date}
  end

  def find_by_updated_at(date)
    @invoices.find{|invoice| invoice.updated_at == date}
  end

  def find_all_by_id(id)
    @invoices.find_all{|invoice| invoice.id == id}
  end

  def find_all_by_customer_id(id)
    @invoices.find_all{|invoice| invoice.customer_id == id}
  end

  def find_all_by_merchant_id(id)
    @invoices.find_all{|invoice| invoice.merchant_id == id}
  end

  def find_all_by_status(stat)
    @invoices.find_all{|invoice| invoice.status == stat}
  end

  def find_all_by_created_at(date)
    @invoices.find_all{|invoice| invoice.created_at == date}
  end

  def find_all_by_updated_at(date)
    @invoices.find_all{|invoice| invoice.updated_at == date}
  end

end

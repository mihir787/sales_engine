require_relative 'invoice'

class InvoiceRepository

  def initialize(invoices)
    @invoices = invoices
  end

  def all
    @invoices
  end

  def inspect
    "#<#{self.class} #{customers.size} rows>"
  end

  def random
    @invoices.sample
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

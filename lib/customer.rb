class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at, :parent

  def initialize(data, parent)
    @id           =   data[:id].to_i
    @first_name   =   data[:first_name]
    @last_name    =   data[:last_name]
    @created_at   =   Date.parse(data[:created_at])
    @updated_at   =   Date.parse(data[:updated_at])
    @parent       =   parent
  end

  def invoices
    @invoices ||= parent.find_invoices(@id)
  end

  def transactions
    invoices.map do |invoice|
      invoice.transactions
    end.flatten
  end
  

  def favorite_merchant
    get_merchants_for_all_invoices.max_by do |merchant|
      get_merchants_for_all_invoices.count(merchant)
    end
  end

  def successful_invoices_for_this_customer
      @successful_invoices ||= parent.sales_engine
                                     .invoice_repository
                                     .find_all_successful_invoices
  end

  def get_merchants_for_successful_invoices
    @merchants ||= successful_invoices_for_this_customer.map do |invoice|
      merchant_relationship.find_by_id(invoice.merchant_id)
    end
  end

  def get_merchants_for_all_invoices
    @merchants ||= invoices.map do |invoice|
      parent.sales_engine.merchant_repository.find_by_id(invoice.merchant_id)
    end
  end

  def merchant_relationship
    parent.sales_engine.merchant_repository
  end

end

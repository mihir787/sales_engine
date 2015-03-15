class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(data, parent)
    @id           =   data[:id]
    @first_name   =   data[:first_name]
    @last_name    =   data[:last_name]
    @created_at   =   data[:created_at]
    @updated_at   =   data[:updated_at]
    @parent       =   parent
  end

  def invoices
    @parent.find_invoices(id)
  end

  def transactions
    invoices.map do |invoice|
      invoice.transactions
    end
  end

end


#transactions returns an array of Transaction instances associated with the customer

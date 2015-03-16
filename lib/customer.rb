class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(data, parent)
    @id           =   data[:id].to_i
    @first_name   =   data[:first_name]
    @last_name    =   data[:last_name]
    @created_at   =   Date.parse(data[:created_at])
    @updated_at   =   Date.parse(data[:updated_at])
    @parent       =   parent
  end

  def invoices
    @parent.find_invoices(@id)
  end

  def transactions #retest this, im not sure its working.
    invoices.map do |invoice|
      invoice.transactions
    end.flatten
  end

  def favorite_merchant
    successful_transaction_merchants.max_by do |merchant|
      successful_transaction_merchants.count(merchant)
    end
  end


  private

  def select_successful_transactions
    transactions.select { |transaction| transaction.successful_transaction? }
  end

  def successful_transaction_invoices
    select_successful_transactions.map {|transaction| transaction.invoice}
  end

  def successful_transaction_merchants
    successful_transaction_invoices.map { |invoice| invoice.merchant }
  end

end

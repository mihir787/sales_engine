# require_relative 'customer'
# require_relative 'customer_repository'

class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(data, parent)
    @id           =   data[:id]
    @customer_id  =   data[:customer_id]
    @merchant_id  =   data[:merchant_id]
    @status       =   data[:status]
    @created_at   =   data[:created_at]
    @updated_at   =   data[:updated_at]
    @parent       =   parent
  end

  def customer
    @parent.find_by_customer(@customer_id)
  end

end

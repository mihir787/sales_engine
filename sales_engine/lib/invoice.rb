require_relative 'customer'
require_relative 'customer_repository'

class Invoice
  attr_reader :customer_id, :merchant_id, :status, :created_at, :updated_at

  def initialize(data)
    @id           =   data[:id]
    @customer_id  =   data[:customer_id]
    @merchant_id  =   data[:merchant_id]
    @status       =   data[:status]
    @created_at   =   data[:created_at]
    @updated_at   =   data[:updated_at]
  end

end

# class Invoice
#
#   def initialize(customer_repo, attributes = {})
#     @customer_id = attributes['customer_id']
#     @customer_repo = customer_repo
#   end
#
#   def customer
#     @customer_repo.find_by_id(@customer_id)

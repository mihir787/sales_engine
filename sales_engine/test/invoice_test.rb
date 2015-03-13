require_relative './test_helper'
require_relative '../lib/invoice'

class InvoiceTest < Minitest::Test
  attr_reader :data

  def setup
    @data = {
              id:     "1",
              customer_id: "1",
              merchant_id: "25",
              status: "shipped",
              created_at: "10/10/10",
              updated_at: "12/12/12"
              }
  end

  def test_it_can_call_up_to_repository_with_customer
    parent = Minitest::Mock.new
    invoice = Invoice.new(data,parent)
    parent.expect(:find_by_customer, [1,2], ["1"])
    assert_equal [1,2], invoice.customer
    parent.verify
  end

  # def setup
  #   data = { :id "1", :customer_id: "1", merchant_id: "26", status: "shipped",
  #     created_at: "2012-03-25 09:54:09 UTC", updated_at: "2012-03-25 09:54:09 UTC"}
  #
  # # def test_returns_a_customer
  # #   skip
  # #   customer1 = Customer.new('id' => '12345')
  # #   customer2 = Customer.new('id' => '53212')
  # #   customers = [customer1, customer2]
  # #   customer_repo = CustomerRepository.new(customers)
  # #   invoice = Invoice.new(customer_repo, 'customer_id' => "12345")
  #
  #   @invoice = Invoice.new(data)
  # end

#   def test_id
#     assert_equal "1", @invoice.test_id
#   end
#
#   def test_customer_id
#     assert_equal "1", @invoice.customer_id
#   end
#
#   def test_merchant_id
#     assert_equal "26", @invoice.merchant_id
#   end
#
#   def test_status
#     assert_equal "shipped", @invoice.status
#   end
#
#   def test_created_at
#     assert_equal "2012-03-25 09:54:09 UTC", @invoice.created_at
#   end
#
#   def test_updated_at
#     assert_equal "2012-03-25 09:54:09 UTC", @invoice.updated_at
#   end
# end
#


  # def test_returns_a_customer
  #
  #   customer1 = Customer.new('id' => '12345')
  #   customer2 = Customer.new('id' => '53212')
  #   customers = [customer1, customer2]
  #   customer_repo = CustomerRepository.new(customers)
  #   invoice = Invoice.new(customer_repo, 'customer_id' => "12345")
  #
  #   assert_equal customer1, invoice.customer
  #
  # end
end

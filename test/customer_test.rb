require_relative 'test_helper'
require_relative '../lib/customer'
require_relative '../lib/sales_engine'
require_relative '../lib/customer_repository'

class CustomerTest < MiniTest::Test
  attr_reader :data, :customer
  def setup
    @data = {  id: "7",
              first_name: "Parker",
              last_name: "Daugherty",
              created_at: "2012-03-27 14:54:10 UTC",
              updated_at: "2012-03-27 14:54:10 UTC"
              }

    @customer = Customer.new(data, nil)
  end

  def test_id
    assert_equal 7, @customer.id
  end

  def test_first_name
    assert_equal "Parker", @customer.first_name
  end

  def test_last_name
    assert_equal "Daugherty", @customer.last_name
  end

  def test_created_at
    assert @customer.created_at
  end

  def test_updated_at
    assert @customer.updated_at
  end

  def test_it_can_call_up_to_repository_with_customer_id
    parent = Minitest::Mock.new
    customer = Customer.new(data, parent)
    parent.expect(:find_invoices, ["pizza", "burgers"], [7])
    assert_equal ["pizza", "burgers"], customer.invoices
    parent.verify
  end

  def test_it_can_get_transactions_through_invoices
    sales_engine = SalesEngine.new("./fixtures")
    sales_engine.startup
    customer = sales_engine.customer_repository.customers[3]
    customer1 = sales_engine.customer_repository.customers[1]

    assert_equal 0, customer.transactions.count
    assert_equal 2, customer1.transactions.count
  end


  def test_favorite_merchant
    sales_engine = SalesEngine.new("./fixtures")
    sales_engine.startup
    customer = sales_engine.customer_repository.find_by_id(2)
    # puts customer.transactions
    assert_equal "Wisozk, Hoeger and Bosco", customer.favorite_merchant.name
  end



end

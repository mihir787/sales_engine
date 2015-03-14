require_relative 'test_helper'
require_relative '../lib/customer'

class CustomerTest < MiniTest::Test
  attr_reader :data

  def setup
    @data = { id: "7", first_name: "Parker", last_name: "Daugherty",
      created_at: "2012-03-27 14:54:10 UTC", updated_at: "2012-03-27 14:54:10 UTC" }

    @customer = Customer.new(data, nil)
  end

  def test_id
    assert_equal "7", @customer.id
  end

  def test_first_name
    assert_equal "Parker", @customer.first_name
  end

  def test_last_name
    assert_equal "Daugherty", @customer.last_name
  end

  def test_created_at
    assert_equal "2012-03-27 14:54:10 UTC", @customer.created_at
  end

  def test_updated_at
    assert_equal "2012-03-27 14:54:10 UTC", @customer.updated_at
  end

  def test_it_can_call_up_to_repository_with_customer_id
    parent = Minitest::Mock.new
    customer = Customer.new(data, parent)
    parent.expect(:find_invoices, ["pizza", "burgers"], ["7"])
    assert_equal ["pizza", "burgers"], customer.invoices
    parent.verify
  end


end

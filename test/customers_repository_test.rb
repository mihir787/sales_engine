require_relative 'test_helper'
require_relative '../lib/customer_repository'
require_relative '../lib/sales_engine'

class CustomerRepositoryTest < Minitest::Test
  attr_reader :sales_engine
  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
  end

  def test_returns_all_customers
    assert_equal 7, sales_engine.customer_repository.all.count
  end

  def test_returns_random_customer
    sample = []
    sample << sales_engine.customer_repository.random
    assert_equal 1, sample.length
  end

  def test_returns_customer_with_matching_id
    result = sales_engine.customer_repository.find_by_id("1000")
    assert_equal "1000", result.id
  end

  def test_returns_customer_with_matching_first_name
    result = sales_engine.customer_repository.find_by_first_name("Joey")
    assert_equal "Joey", result.first_name
  end

  def test_returns_customer_with_matching_last_name
    result = sales_engine.customer_repository.find_by_last_name("Ondricka")
    assert_equal "Ondricka", result.last_name
  end

  def test_returns_customer_with_matching_created_at_date
    result = sales_engine.customer_repository.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", result.created_at
  end

  def test_returns_customer_with_matching_updated_at_date
    result = sales_engine.customer_repository.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", result.updated_at
  end

  def test_returns_all_customers_with_matching_first_name
    result = sales_engine.customer_repository.find_all_by_first_name("Joey")
    assert_equal "Joey", result.first.first_name
  end

  def test_returns_all_customers_with_matching_last_name
    result = sales_engine.customer_repository.find_all_by_last_name("Ondricka")
    assert_equal "Ondricka", result.first.last_name
  end

  def test_returns_all_customers_with_matching_id_name
    result = sales_engine.customer_repository.find_all_by_id("1000")
    assert_equal "1000", result.first.id
  end

  def test_returns_all_customers_with_matching_created_at_date
    result = sales_engine.customer_repository.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", result.created_at
  end

  def test_returns_all_customers_with_matching_updated_at_date
    result = sales_engine.customer_repository.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", result.first.updated_at
  end

  def test_it_can_call_up_to_parent_to_find_invoice
    parent = Minitest::Mock.new
    customer_repository = CustomerRepository.new(parent)
    parent.expect(:find_invoices_by_customer_id, "rex", [1])
    assert_equal "rex", customer_repository.find_invoices(1)
  end
end

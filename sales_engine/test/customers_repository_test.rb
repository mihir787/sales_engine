require_relative 'test_helper'
require_relative '../lib/customer_repository'

class CustomerRepositoryTest < Minitest::Test

  def test_returns_all_customers
    customer1 = Customer.new(:first_name => "bobby")
    customer2 = Customer.new(:first_name => "mike")
    customers = [customer1, customer2]
    customer_repo = CustomerRepository.new(customers)
    assert_equal [customer1, customer2], customer_repo.all
  end

  def test_returns_random_customer
    customer1 = Customer.new(:first_name => "bobby")
    customer2 = Customer.new(:first_name => "mike")
    customers = [customer1, customer2]
    customer_repo = CustomerRepository.new(customers)
    sample = []
    sample << customer_repo.random
    assert_equal 1, sample.length
  end

  def test_returns_customer_with_matching_first_name
    customer1 = Customer.new(:first_name => "bobby")
    customer2 = Customer.new(:first_name => "john")
    customers = [customer1, customer2]
    customer_repo = CustomerRepository.new(customers)
    assert_equal customer1, customer_repo.find_by_first_name("bobby")
  end

  def test_returns_customer_with_matching_last_name
    customer1 = Customer.new(:last_name => "white")
    customer2 = Customer.new(:last_name => "williams")
    customers = [customer1, customer2]
    customer_repo = CustomerRepository.new(customers)
    assert_equal customer2, customer_repo.find_by_last_name("williams")
  end

  def test_returns_customer_with_matching_created_at_date
    customer1 = Customer.new(:created_at => "01/02/15")
    customer2 = Customer.new(:created_at => "10/05/15")
    customers = [customer1, customer2]
    customer_repo = CustomerRepository.new(customers)
    assert_equal customer2, customer_repo.find_by_created_at("10/05/15")
  end

  def test_returns_customer_with_matching_updated_at_date
    customer1 = Customer.new(:updated_at => "01/02/15")
    customer2 = Customer.new(:updated_at => "10/05/15")
    customers = [customer1, customer2]
    customer_repo = CustomerRepository.new(customers)
    assert_equal customer2, customer_repo.find_by_updated_at("10/05/15")
  end

  def test_returns_all_customers_with_matching_first_name
    customer1 = Customer.new(:first_name => "bobby")
    customer2 = Customer.new(:first_name => "mike")
    customer3 = Customer.new(:first_name => "bobby")
    customer4 = Customer.new(:first_name => "john")
    customers = [customer1, customer2, customer3, customer4]
    customer_repo = CustomerRepository.new(customers)
    assert_equal [customer1, customer3], customer_repo.find_all_by_first_name("bobby")
  end

  def test_returns_all_customers_with_matching_last_name
    customer1 = Customer.new(:last_name => "brown")
    customer2 = Customer.new(:last_name => "singh")
    customer3 = Customer.new(:last_name => "lee")
    customer4 = Customer.new(:last_name => "lee")
    customers = [customer1, customer2, customer3, customer4]
    customer_repo = CustomerRepository.new(customers)
    assert_equal [customer3, customer4], customer_repo.find_all_by_last_name("lee")
  end

  def test_returns_all_customers_with_matching_id_name
    customer1 = Customer.new(:id => "12345")
    customer2 = Customer.new(:id => "99999")
    customer3 = Customer.new(:id => "88888")
    customer4 = Customer.new(:id => "12345")
    customers = [customer1, customer2, customer3, customer4]
    customer_repo = CustomerRepository.new(customers)
    assert_equal [customer1, customer4], customer_repo.find_all_by_id("12345")
  end

  def test_returns_all_customers_with_matching_created_at_date
    customer1 = Customer.new(:created_at => "10/05/15")
    customer2 = Customer.new(:created_at => "02/05/15")
    customer3 = Customer.new(:created_at => "04/05/15")
    customer4 = Customer.new(:created_at => "10/05/15")
    customers = [customer1, customer2, customer3, customer4]
    customer_repo = CustomerRepository.new(customers)
    assert_equal [customer1, customer4], customer_repo.find_all_by_created_at("10/05/15")
  end

  def test_returns_all_customers_with_matching_updated_at_date
    customer1 = Customer.new(:updated_at => "12/05/15")
    customer2 = Customer.new(:updated_at => "04/05/15")
    customer3 = Customer.new(:updated_at => "04/05/15")
    customer4 = Customer.new(:updated_at => "06/05/15")
    customers = [customer1, customer2, customer3, customer4]
    customer_repo = CustomerRepository.new(customers)
    assert_equal [customer2, customer3], customer_repo.find_all_by_updated_at("04/05/15")
  end

  def test_returns_customer_id
    customer1 = Customer.new(:id => "12345")
    customer2 = Customer.new(:id => "99999")
    customers = [customer1, customer2]
    customer_repo = CustomerRepository.new(customers)
    assert_equal customer1, customer_repo.find_by_id("12345")
  end

end

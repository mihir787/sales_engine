require_relative 'test_helper'
require_relative '../lib/invoice_repository'
require_relative '../lib/sales_engine'
require_relative '../lib/merchant'
require_relative '../lib/customer'
require_relative '../lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test
  attr_reader :sales_engine
  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
  end

  def test_it_can_call_up_to_sales_engine_with_invoice_id_to_find_invoice
    parent = Minitest::Mock.new
    invoice_repo = InvoiceRepository.new(parent)
    parent.expect(:invoice_find_customer_by_customer_id, "fries", [1])
    assert_equal "fries", invoice_repo.find_by_customer(1)
    parent.verify
  end

  def test_it_can_call_up_to_sales_engine_with_invoice_id_to_find_all_transactions
    parent = Minitest::Mock.new
    invoice_repo = InvoiceRepository.new(parent)
    parent.expect(:invoice_find_all_transactions_by_id, "chips", [1])
    assert_equal "chips", invoice_repo.find_transactions_by_id(1)
    parent.verify
  end

  def test_it_can_call_up_to_sales_engine_with_invoice_id_to_find_all_transactions
    parent = Minitest::Mock.new
    invoice_repo = InvoiceRepository.new(parent)
    parent.expect(:invoice_find_all_invoice_items_by_id, "fish", [1])
    assert_equal "fish", invoice_repo.find_invoice_items_by_id(1)
    parent.verify
  end

  def test_it_can_call_up_to_sales_engine_with_invoice_id_to_find_all_transactions
    parent = Minitest::Mock.new
    invoice_repo = InvoiceRepository.new(parent)
    parent.expect(:invoice_find_merchant_by_id, "soda", [1])
    assert_equal "soda", invoice_repo.find_merchant_by_id(1)
    parent.verify
  end

  def test_returns_all_invoices
    assert_equal 7, sales_engine.invoice_repository.all.count
  end

  def test_returns_random_invoice
    sample = []
    sample << sales_engine.invoice_repository.random
    assert_equal 1, sample.length
  end

  def test_returns_invoice_with_matching_id
    result = sales_engine.invoice_repository.find_by_id(4838)
    assert_equal 4838, result.id
  end

  def test_returns_invoice_with_matching_customer_id
    result = sales_engine.invoice_repository.find_by_customer_id(999)
    assert_equal 4838, result.id
  end

  def test_returns_invoice_with_matching_merchant_id
    result =  sales_engine.invoice_repository.find_by_merchant_id(26)
    assert_equal 4838, result.id
  end

  def test_returns_invoice_with_matching_status
    result = sales_engine.invoice_repository.find_by_status("shipped")
    assert_equal 1, result.id
  end

  def test_returns_invoice_with_matching_created_at_date
    result = sales_engine.invoice_repository.find_by_created_at(Date.parse("2012-03-07 09:58:15 UTC"))
    assert_equal 4840, result.id
  end

  def test_returns_invoice_with_matching_updated_at_date
    result = sales_engine.invoice_repository.find_by_updated_at(Date.parse("2012-03-23 02:58:15 UTC"))
    assert_equal 2, result.id
  end

  def test_returns_all_invoices_with_matching_id
    result = sales_engine.invoice_repository.find_all_by_id(4842)
    assert_equal 1, result.count
  end

  def test_returns_all_invoices_with_matching_customer_id
    result = sales_engine.invoice_repository.find_all_by_customer_id(999)
    assert_equal 2, result.count
  end

  def test_returns_all_invoices_with_matching_merchant_id
    result =  sales_engine.invoice_repository.find_all_by_merchant_id(26)
    assert_equal 1, result.count
  end

  def test_returns_all_invoice_with_matching_status
    result = sales_engine.invoice_repository.find_all_by_status("shipped")
    assert_equal 7, result.count
  end

  def test_returns_all_invoices_with_matching_created_at_date
    result = sales_engine.invoice_repository.find_all_by_updated_at(Date.parse("2012-03-07 09:58:15 UTC"))
    assert_equal 1, result.count
  end

  def test_returns_all_invoices_with_matching_updated_at_date
    result = sales_engine.invoice_repository.find_all_by_updated_at(Date.parse("2012-03-25 09:54:09 UTC"))
    assert_equal 1, result.count
  end

  def test_create_invoice
    sales_engine = SalesEngine.new("./fixtures")
    sales_engine.startup
    customer_data = { id: "100000", first_name: "bill", last_name: "peters",
      created_at: "#{Time.now}", updated_at: "#{Time.now}" }
    merchant_data = {id: "1000000", name: "Hogwarts",created_at: "#{Time.now}",
      updated_at: "#{Time.now}" }
    item_data = { id: "4000000", name: "fish", description: "cool",
      unit_price: "76400", merchant_id: "1000000", created_at: "#{Time.now}",
      updated_at: "#{Time.now}" }
    item = Item.new(item_data, sales_engine.item_repository)
    customer = Customer.new(customer_data, sales_engine.customer_repository)
    merchant = Merchant.new(merchant_data, sales_engine.merchant_repository)
    input = {customer: customer, merchant: merchant, status: "shipped",
      items: [item, item, item] }


    result = sales_engine.invoice_repository.create(input)

    assert_equal 3, result.id
    assert_equal 100000, result.customer_id
    assert_equal 1000000, result.merchant_id
    assert_equal "shipped", result.status
  end



end

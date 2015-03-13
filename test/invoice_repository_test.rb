require_relative 'test_helper'
require_relative '../lib/invoice_repository'
require_relative '../lib/sales_engine'

class InvoiceRepositoryTest < Minitest::Test
  attr_reader :sales_engine
  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
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
    result = sales_engine.invoice_repository.find_by_id("4838")
    assert_equal "4838", result.id
  end

  def test_returns_invoice_with_matching_customer_id
    result = sales_engine.invoice_repository.find_by_customer_id("999")
    assert_equal "999", result.customer_id
  end

  def test_returns_invoice_with_matching_merchant_id
    result =  sales_engine.invoice_repository.find_by_merchant_id("26")
    assert_equal "26", result.merchant_id
  end

  def test_returns_invoice_with_matching_status
    result = sales_engine.invoice_repository.find_by_status("shipped")
    assert_equal "shipped", result.status
  end

  def test_returns_invoice_with_matching_created_at_date
    result = sales_engine.invoice_repository.find_by_created_at("2012-03-25 09:54:09 UTC")
    assert_equal "2012-03-25 09:54:09 UTC", result.created_at
  end

  def test_returns_invoice_with_matching_updated_at_date
    result = sales_engine.invoice_repository.find_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal "2012-03-25 09:54:09 UTC", result.updated_at
  end

  def test_returns_all_invoices_with_matching_id
    result = sales_engine.invoice_repository.find_all_by_id("4842")
    assert_equal 1, result.count
  end

  def test_returns_all_invoices_with_matching_customer_id
    result = sales_engine.invoice_repository.find_all_by_customer_id("999")
    assert_equal 2, result.count
  end

  def test_returns_all_invoices_with_matching_merchant_id
    result =  sales_engine.invoice_repository.find_all_by_merchant_id("26")
    assert_equal 2, result.count
  end

  def test_returns_all_invoice_with_matching_status
    result = sales_engine.invoice_repository.find_all_by_status("shipped")
    assert_equal 7, result.count
  end

  def test_returns_all_invoices_with_matching_created_at_date
    result = sales_engine.invoice_repository.find_all_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, result.count
  end

  def test_returns_all_invoices_with_matching_updated_at_date
    result = sales_engine.invoice_repository.find_all_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, result.count
  end


end
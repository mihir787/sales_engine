require_relative 'test_helper'
require_relative '../lib/sales_engine'

class SalesEngineTest < Minitest::Test
  attr_reader :sales_engine
  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
  end

  def test_invoice_returns_customer_by_customer_id
    result = sales_engine.invoice_find_customer_by_customer_id("995")
    assert_equal "995", result.id
  end

  def test_invoice_find_all_transactions_by_id
    result = sales_engine.invoice_find_all_transactions_by_id("1")
    assert_equal 1, result.count
  end

  def test_invoice_find_all_invoice_items_by_id
    result = sales_engine.invoice_find_all_invoice_items_by_id("1")
    assert_equal 1, result.count
  end

  def test_invoice_find_merchant_by_id
    result = sales_engine.invoice_find_merchant_by_id("1")
    assert_equal "1", result.id
  end

  def test_merchant_find_item_by_id
    result = sales_engine.merchant_find_item_by_id("1")
    assert_equal "1", result.id
  end

  def test_merchant_find_invoice_by_id
    result = sales_engine.merchant_find_invoice_by_id("1")
    assert_equal 0, result.count
  end

  def test_returns_item_for_merchant
    result = sales_engine.merchant_find_item_by_id("1")
    assert_equal "1", result.id
  end

  def test_returns_invoice_for_merchant
    result = sales_engine.merchant_find_invoice_by_id("26")
    assert_equal 2, result.count
  end

  def test_returns_invoice_for_invoice_item
    result = sales_engine.merchant_find_invoice_by_id("1")
    assert_equal 0, result.count
  end

  def test_invoice_item_find_invoice_by_invoice_id
    result = sales_engine.invoice_item_find_invoice_by_invoice_id("1")
    assert_equal "1", result.id
  end

  def test_invoice_item_find_item_by_item_id
    result = sales_engine.invoice_item_find_item_by_item_id(1)
    assert_equal 1, result.id
  end

  def test_customer_find_invoices_by_customer_id
    result = sales_engine.customer_find_invoices_by_customer_id("1")
    assert_equal 1, result.count
  end

  def test_item_find_invoice_items_by_item_id
    result = sales_engine.item_find_invoice_items_by_item_id("1")
    assert_equal 0, result.count
  end

  def test_item_find_merchant_by_merchant_id
    result = sales_engine.item_find_invoice_items_by_item_id("1")
    assert_equal 0, result.count
  end

  def test_transaction_find_invoice_by_invoice_id
    result = sales_engine.transaction_find_invoice_by_invoice_id("1")
    assert_equal "1", result.id
  end


end

require_relative 'test_helper'
require_relative '../lib/invoice_item_repository'
require_relative '../lib/sales_engine'
require 'bigdecimal'
require 'bigdecimal/util'

class InvoiceItemRepositoryTest < Minitest::Test
  attr_reader :sales_engine
  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
  end

  def test_it_can_call_up_to_sales_engine_with_invoice_id_to_find_invoice
    parent = Minitest::Mock.new
    invoice_item_repo = InvoiceItemRepository.new(parent)
    parent.expect(:invoice_item_find_invoice_by_invoice_id, "bagel", [1])
    assert_equal "bagel", invoice_item_repo.find_invoice_by_invoice_id(1)
    parent.verify
  end

  def test_it_can_call_up_to_sales_engine_with_id_to_find_invoice
    parent = Minitest::Mock.new
    invoice_item_repo = InvoiceItemRepository.new(parent)
    parent.expect(:invoice_item_find_item_by_item_id, "pretzel", [539])
    assert_equal "pretzel", invoice_item_repo.find_item_by_item_id(539)
    parent.verify
  end

  def test_returns_all_item_invoices
    result = sales_engine.invoice_item_repository.all
    assert_equal 6, result.count
  end

  def test_returns_random_invoice
    sample = []
    sample << sales_engine.invoice_item_repository.random
    assert_equal 1, sample.length
  end

  def test_returns_invoice_item_with_matching_id
    result = sales_engine.invoice_item_repository.find_by_id(21683)
    assert_equal 21683, result.id
  end

  def test_returns_invoice_item_with_matching_invoice_id
    result = sales_engine.invoice_item_repository.find_by_invoice_id(1)
    assert_equal 1, result.invoice_id
  end

  def test_returns_invoice_item_with_matching_item_id
    result = sales_engine.invoice_item_repository.find_by_item_id(2)
    assert_equal 2, result.item_id
  end

  def test_returns_invoice_item_with_matching_quantity
    result = sales_engine.invoice_item_repository.find_by_quantity(3)
    assert_equal 3, result.quantity
  end

  def test_returns_invoice_item_with_matching_unit_price
    result = sales_engine.invoice_item_repository.find_by_unit_price(22220.to_d/100)
    assert_equal 21686, result.id
  end

  def test_returns_invoice_with_matching_created_at_date
    result = sales_engine.invoice_item_repository.find_by_created_at(Date.parse("2012-03-27 14:58:15 UTC"))
    assert_equal 1, result.id
  end

  def test_returns_invoice_with_matching_updated_at_date
    result = sales_engine.invoice_item_repository.find_by_updated_at(Date.parse("2012-03-27 14:58:15 UTC"))
    assert_equal 1, result.id
  end

  def test_returns_all_invoice_item_with_matching_id
    result = sales_engine.invoice_item_repository.find_all_by_id(21683)
    assert_equal 1, result.count
  end

  def test_returns_all_invoice_item_with_matching_item_id
    result = sales_engine.invoice_item_repository.find_all_by_item_id(2)
    assert_equal 2, result.first.item_id
  end

  def test_returns_all_invoice_item_with_matching_invoice_id
    result = sales_engine.invoice_item_repository.find_all_by_invoice_id(1)
    assert_equal 1, result.count
  end

  def test_returns_all_invoice_item_with_matching_quantity
    result = sales_engine.invoice_item_repository.find_all_by_quantity(3)
    assert_equal 1, result.count
  end

  def test_returns_all_invoice_item_with_matching_unit_price
    result = sales_engine.invoice_item_repository.find_all_by_unit_price(94117.to_d/100)
    assert_equal 2, result.count
  end

  def test_returns_all_invoice_item_with_matching_created_at
    result = sales_engine.invoice_item_repository.find_all_by_created_at(Date.parse("2012-03-27 14:58:15 UTC"))
    assert_equal 6, result.count
  end

  def test_returns_all_invoice_item_with_matching_updated_at
    result = sales_engine.invoice_item_repository.find_all_by_updated_at(Date.parse("2012-03-27 14:58:15 UTC"))
    assert_equal 6, result.count
  end

end

require_relative 'test_helper'
require_relative '../lib/transaction_repository'
require_relative '../lib/sales_engine'

class TransactionRepositoryTest < Minitest::Test
  attr_reader :sales_engine
  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
  end

  def test_returns_all_item_transactions
    assert_equal 6, sales_engine.transaction_repository.all.count
  end

  def test_returns_random_transaction
    sample = []
    sample << sales_engine.transaction_repository.random
    assert_equal 1, sample.length
  end

  def test_returns_transaction_item_with_matching_id
    result = sales_engine.transaction_repository.find_by_id("5591")
    assert_equal "5591", result.id
  end

  def test_returns_transaction_item_with_matching_invoice_id
    result = sales_engine.transaction_repository.find_by_invoice_id("4842")
    assert_equal  "4842" , result.invoice_id
  end

  def test_returns_transaction_item_with_matching_credit_card_number
    result = sales_engine.transaction_repository.find_by_credit_card_number("4397199533314394")
    assert_equal  "4397199533314394", result.credit_card_number
  end

  def test_returns_transaction_item_with_matching_credit_card_expiration_date
    result = sales_engine.transaction_repository.find_by_credit_card_expiration_date(nil)
    assert_equal nil, result.credit_card_expiration_date
  end

  def test_returns_transaction_item_with_matching_result
    result = sales_engine.transaction_repository.find_by_result("failed")
    assert_equal  "5591" , result.id
  end

  def test_returns_transaction_with_matching_created_at_date
    result = sales_engine.transaction_repository.find_by_created_at("2012-03-27 14:58:15 UTC")
    assert_equal "5591", result.id
  end

  def test_returns_transaction_with_matching_updated_at_date
    result = sales_engine.transaction_repository.find_by_updated_at("2012-03-27 14:58:15 UTC")
    assert_equal "5591", result.id
  end

  def test_returns_all_invoice_item_with_matching_id
    result = sales_engine.transaction_repository.find_all_by_id("5593")
    assert_equal 1, result.count
  end

  def test_returns_all_invoice_item_with_matching_invoice_id
    result = sales_engine.transaction_repository.find_all_by_invoice_id("4842")
    assert_equal 2, result.count
  end

  def test_returns_all_invoice_item_with_matching_result
    result = sales_engine.transaction_repository.find_all_by_result("success")
    assert_equal 4, result.count
  end

  def test_returns_all_invoice_item_with_matching_credit_card_number
    result = sales_engine.transaction_repository.find_all_by_credit_card_number("4680790942233742")
    assert_equal 1, result.count
    assert_equal "4680790942233742", result[0].credit_card_number
  end

  def test_returns_all_invoice_item_with_matching_credit_card_expiration_date
    result = sales_engine.transaction_repository.find_all_by_credit_card_expiration_date(nil)
    assert_equal 6, result.count
  end

  def test_returns_all_invoice_item_with_matching_created_at
    result = sales_engine.transaction_repository.find_all_by_created_at("2012-03-27 14:58:15 UTC")
    assert_equal 5, result.count
  end

  def test_returns_all_invoice_item_with_matching_updated_at
    result = sales_engine.transaction_repository.find_all_by_updated_at("2012-03-27 14:58:15 UTC")
    assert_equal 5, result.count
  end

end

require_relative 'test_helper'
require_relative '../lib/transaction'
require_relative '../lib/sales_engine'

class TransactionTest < Minitest::Test
  attr_reader :sales_engine

  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
  end

  def test_returns_cusomter_by_id
    result = sales_engine.transaction_repository.find_by_id("5591")
    assert_equal "5591", result.id
  end

  def test_invoice_id
    result = sales_engine.transaction_repository.find_by_id("5591")
    assert_equal "4841", result.invoice_id
  end

  def test_credit_card_number
    result = sales_engine.transaction_repository.find_by_id("5594")
    assert_equal "4148878905213123", result.credit_card_number
  end

  def test_credit_card_expiration
    result = sales_engine.transaction_repository.find_by_id("5591")
    assert_equal nil, result.credit_card_expiration_date
  end

  def test_result
    result = sales_engine.transaction_repository.find_by_id("5591")
    assert_equal "failed", result.result
  end

  def test_created_at
    result = sales_engine.transaction_repository.find_by_id("5591")
    assert_equal "2012-03-27 14:58:15 UTC", result.created_at
  end

  def test_updated_at
    result = sales_engine.transaction_repository.find_by_id("5591")
    assert_equal "2012-03-27 14:58:15 UTC", result.updated_at
  end
end

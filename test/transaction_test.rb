require_relative 'test_helper'
require_relative '../lib/transaction'
require_relative '../lib/sales_engine'

class TransactionTest < Minitest::Test
  attr_reader :sales_engine

  def setup
    @data = { id: "1", invoice_id: "422", credit_card_number: "12345678", credit_card_expiration: nil,
      result: "shipped", created_at: "August", updated_at: "Friday"}

    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
  end

  def test_returns_cusomter_by_id
    result = sales_engine.transaction_repository.find_by_id(2)
    assert_equal 2, result.id
  end

  def test_invoice_id
    result = sales_engine.transaction_repository.find_by_id(1)
    assert_equal 1, result.invoice_id
  end

  def test_credit_card_number
    result = sales_engine.transaction_repository.find_by_id(1)
    assert_equal "12345678", result.credit_card_number
  end

  def test_credit_card_expiration
    result = sales_engine.transaction_repository.find_by_id(2)
    assert_equal 0, result.credit_card_expiration_date
  end

  def test_result
    result = sales_engine.transaction_repository.find_by_id(2)
    assert_equal "success", result.result
  end

  def test_created_at
    result = sales_engine.transaction_repository.find_by_id(1)
    assert_equal 27, result.created_at.mday
  end

  def test_updated_at
    result = sales_engine.transaction_repository.find_by_id(2)
    assert_equal 27, result.updated_at.mday
  end

  def test_it_can_call_up_to_repository_with_customer_id
    parent = Minitest::Mock.new
    transaction = Transaction.new(@data, parent)
    parent.expect(:find_invoice, ["pizza", "burgers"], [422])
    assert_equal ["pizza", "burgers"], transaction.invoice
    parent.verify
  end
end

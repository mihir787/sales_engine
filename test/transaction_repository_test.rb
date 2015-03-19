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
    result = sales_engine.transaction_repository.find_by_id(2)
    assert_equal 2, result.id
  end

  def test_returns_transaction_item_with_matching_invoice_id
    result = sales_engine.transaction_repository.find_by_invoice_id(4842)
    assert_equal  4842 , result.invoice_id
  end

  def test_returns_transaction_item_with_matching_credit_card_number
    result = sales_engine.transaction_repository.find_by_credit_card_number("12345678")
    assert_equal  "12345678", result.credit_card_number
  end

  def test_returns_transaction_item_with_matching_credit_card_expiration_date
    result = sales_engine.transaction_repository.find_by_credit_card_expiration_date("")
    assert_equal nil, result
  end

  def test_returns_transaction_item_with_matching_result
    result = sales_engine.transaction_repository.find_by_result("failed")
    assert_equal  1 , result.id
  end

  def test_returns_transaction_with_matching_created_at_date
    result = sales_engine.transaction_repository.find_by_created_at(Date.parse("2012-03-27 14:58:15 UTC"))
    assert_equal 1, result.id
  end

  def test_returns_transaction_with_matching_updated_at_date
    result = sales_engine.transaction_repository.find_by_updated_at(Date.parse("2012-03-27 14:58:15 UTC"))
    assert_equal 1, result.id
  end

  def test_returns_all_invoice_item_with_matching_id
    result = sales_engine.transaction_repository.find_all_by_id(5593)
    assert_equal 1, result.count
  end

  def test_returns_all_invoice_item_with_matching_invoice_id
    result = sales_engine.transaction_repository.find_all_by_invoice_id(4842)
    assert_equal 2, result.count
  end

  def test_returns_all_invoice_item_with_matching_result
    result = sales_engine.transaction_repository.find_all_by_result("success")
    assert_equal 4, result.count
  end

  def test_returns_all_invoice_item_with_matching_credit_card_number
    result = sales_engine.transaction_repository.find_all_by_credit_card_number("12345678")
    assert_equal 1, result.count
    assert_equal "12345678", result[0].credit_card_number
  end

  def test_returns_all_invoice_item_with_matching_credit_card_expiration_date
    result = sales_engine.transaction_repository.find_all_by_credit_card_expiration_date("")
    assert_equal 0, result.count
  end

  def test_returns_all_invoice_item_with_matching_created_at
    result = sales_engine.transaction_repository.find_all_by_created_at(Date.parse("2012-03-27 14:58:15 UTC"))
    assert_equal 6, result.count
  end

  def test_returns_all_invoice_item_with_matching_updated_at
    result = sales_engine.transaction_repository.find_all_by_updated_at(Date.parse("2012-03-27 14:58:15 UTC"))
    assert_equal 6, result.count
  end

  def test_it_can_call_up_to_parent_to_find_invoice
    parent = Minitest::Mock.new
    transaction_repository = TransactionRepository.new(parent)
    parent.expect(:transaction_find_invoice_by_invoice_id, "rex", [1])
    assert_equal "rex", transaction_repository.find_invoice(1)
  end

  def test_create_transaction
    input = { credit_card_number: "123", credit_card_expiration_data: "#{Time.now}",
      result: "success"}
    result = sales_engine.transaction_repository.create_transaction(input, "9999999")

    assert_equal "123", result.pop.credit_card_number
  end

end

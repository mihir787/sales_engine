require_relative 'test_helper'
require_relative '../lib/transaction'
require_relative '../lib/sales_engine'

class TransactionTest < Minitest::Test

  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
  end

  def test_returns_cusomter_by
    result = @sales_engine.transaction_repository.find_by_id("5591")
    assert_equal "7", result
  end

  # def test_invoice_id
  #   assert_equal "8", @transaction.invoice_id
  # end
  #
  # def test_credit_card_number
  #   assert_equal "4801647818676136", @transaction.credit_card_number
  # end
  #
  # def test_credit_card_expiration
  #   assert_equal nil, @transaction.credit_card_expiration_date
  # end
  #
  # def test_result
  #   assert_equal "success", @transaction.result
  # end
  #
  # def test_created_at
  #   assert_equal "2012-03-27 14:54:10 UTC", @transaction.created_at
  # end
  #
  # def test_updated_at
  #   assert_equal "2012-03-27 14:54:10 UTC", @transaction.updated_at
  # end
end

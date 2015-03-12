require_relative 'test_helper'
require_relative '../lib/transaction'

class TransactionTest < Minitest::Test

  def setup
    data =  {id: "7", invoice_id: "8", credit_card_number: "4801647818676136",
      credit_card_expiration: "", result: "success", created_at: "2012-03-27 14:54:10 UTC",
      updated_at: "2012-03-27 14:54:10 UTC" }

    @transaction = Transaction.new(data)
  end

  def test_id
    assert_equal "7", @transaction.id
  end

  def test_invoice_id
    assert_equal "8", @transaction.invoice_id
  end

  def test_credit_card_number
    assert_equal "4801647818676136", @transaction.credit_card_number
  end

  def test_credit_card_expiration
    assert_equal nil, @transaction.credit_card_expiration_date
  end

  def test_result
    assert_equal "success", @transaction.result
  end

  def test_created_at
    assert_equal "2012-03-27 14:54:10 UTC", @transaction.created_at
  end

  def test_updated_at
    assert_equal "2012-03-27 14:54:10 UTC", @transaction.updated_at
  end
end

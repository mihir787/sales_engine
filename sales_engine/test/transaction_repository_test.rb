require_relative 'test_helper'
require_relative '../lib/transaction_repository'

class TransactionRepositoryTest < Minitest::Test
  def test_returns_all_item_transactions
    transaction1 = Transaction.new(:id => "999")
    transaction2 = Transaction.new(:id => "888")
    transactions = [transaction1,  transaction2 ]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal [transaction1, transaction2 ], transaction_repo.all
  end

  def test_returns_random_transaction
    transaction1 = Transaction.new(:id => "123")
    transaction2 = Transaction.new(:id => "321")
    transactions = [transaction1,  transaction2 ]
    transaction_repo = TransactionRepository.new(transactions)
    sample = []
    sample << transaction_repo.random
    assert_equal 1, sample.length
  end

  def test_returns_transaction_item_with_matching_id
    transaction1 = Transaction.new(:id => "5321")
    transaction2 = Transaction.new(:id => "1234")
    transactions = [transaction1,  transaction2 ]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal transaction1, transaction_repo.find_by_id("5321")
  end

  def test_returns_transaction_item_with_matching_invoice_id
    transaction1 = Transaction.new(:invoice_id => "5321")
    transaction2 = Transaction.new(:invoice_id => "1234")
    transactions = [transaction1,  transaction2 ]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal  transaction2 , transaction_repo.find_by_invoice_id("1234")
  end

  def test_returns_transaction_item_with_matching_credit_card_number
    transaction1 = Transaction.new(:credit_card_number => "12312412")
    transaction2 = Transaction.new(:credit_card_number => "643523413")
    transactions = [transaction1,  transaction2 ]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal  transaction2 , transaction_repo.find_by_credit_card_number("643523413")
  end

  def test_returns_transaction_item_with_matching_credit_card_expiration_date
    transaction1 = Transaction.new(:credit_card_expiration_date => "01/10")
    transaction2 = Transaction.new(:credit_card_expiration_date => "02/12")
    transactions = [transaction1,  transaction2 ]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal transaction1, transaction_repo.find_by_credit_card_expiration_date("01/10")
  end

  def test_returns_transaction_item_with_matching_result
    transaction1 = Transaction.new(:result => "25")
    transaction2 = Transaction.new(:result => "30")
    transactions = [transaction1,  transaction2 ]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal  transaction2 , transaction_repo.find_by_result("30")
  end

  def test_returns_transaction_with_matching_created_at_date
    transaction1 = Transaction.new(:created_at => "12/12/12")
    transaction2 = Transaction.new(:created_at => "02/02/02")
    transactions = [transaction1,  transaction2 ]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal  transaction2 , transaction_repo.find_by_created_at("02/02/02")
  end

  def test_returns_transaction_with_matching_updated_at_date
    transaction1 = Transaction.new(:updated_at => "04/02/12")
    transaction2 = Transaction.new(:updated_at => "10/05/15")
    transactions = [transaction1,  transaction2 ]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal  transaction2 , transaction_repo.find_by_updated_at("10/05/15")
  end

  def test_returns_all_invoice_item_with_matching_id
    transaction1 = Transaction.new(:id => "5321")
    transaction2 = Transaction.new(:id => "1234")
    transaction3 = Transaction.new(:id => "9999")
    transaction4 = Transaction.new(:id => "1234")
    transactions = [transaction1,  transaction2 , transaction3, transaction4]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal  [transaction2 ,transaction4], transaction_repo.find_all_by_id("1234")
  end

  def test_returns_all_invoice_item_with_matching_invoice_id
    transaction1 = Transaction.new(:invoice_id => "1234")
    transaction2 = Transaction.new(:invoice_id => "5321")
    transaction3 = Transaction.new(:invoice_id => "1234")
    transaction4 = Transaction.new(:invoice_id => "9999")
    transactions = [transaction1,  transaction2 , transaction3, transaction4]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal [transaction1,transaction3], transaction_repo.find_all_by_invoice_id("1234")
  end

  def test_returns_all_invoice_item_with_matching_result
    transaction1 = Transaction.new(:result => "sent")
    transaction2 = Transaction.new(:result => "sent")
    transaction3 = Transaction.new(:result => "fail")
    transaction4 = Transaction.new(:result => "fail")
    transactions = [transaction1,  transaction2 , transaction3, transaction4]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal  [transaction1 ,transaction2], transaction_repo.find_all_by_result("sent")
  end

  def test_returns_all_invoice_item_with_matching_credit_card_number
    transaction1 = Transaction.new(:credit_card_number => "10012002")
    transaction2 = Transaction.new(:credit_card_number => "20021001")
    transaction3 = Transaction.new(:credit_card_number => "30034004")
    transaction4 = Transaction.new(:credit_card_number => "10012002")
    transactions = [transaction1,  transaction2 , transaction3, transaction4]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal [transaction1,transaction4], transaction_repo.find_all_by_credit_card_number("10012002")
  end

  def test_returns_all_invoice_item_with_matching_credit_card_expiration_date
    transaction1 = Transaction.new(:credit_card_expiration_date => "05/14")
    transaction2 = Transaction.new(:credit_card_expiration_date => "05/14")
    transaction3 = Transaction.new(:credit_card_expiration_date => "12/12")
    transaction4 = Transaction.new(:credit_card_expiration_date => "11/12")
    transactions = [transaction1,  transaction2 , transaction3, transaction4]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal [transaction1,transaction2], transaction_repo.find_all_by_credit_card_expiration_date("05/14")
  end

  def test_returns_all_invoice_item_with_matching_created_at
    transaction1 = Transaction.new(:created_at => "05/05/95")
    transaction2 = Transaction.new(:created_at => "05/05/95")
    transaction3 = Transaction.new(:created_at => "05/10/95")
    transaction4 = Transaction.new(:created_at => "05/05/95")
    transactions = [transaction1,  transaction2 , transaction3, transaction4]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal [transaction1, transaction2 ,transaction4], transaction_repo.find_all_by_created_at("05/05/95")
  end

  def test_returns_all_invoice_item_with_matching_updated_at
    transaction1 = Transaction.new(:updated_at => "05/10/95")
    transaction2 = Transaction.new(:updated_at => "05/05/95")
    transaction3 = Transaction.new(:updated_at => "05/10/95")
    transaction4 = Transaction.new(:updated_at => "05/05/95")
    transactions = [transaction1,  transaction2 , transaction3, transaction4]
    transaction_repo = TransactionRepository.new(transactions)
    assert_equal [transaction1,transaction3], transaction_repo.find_all_by_updated_at("05/10/95")
  end

end

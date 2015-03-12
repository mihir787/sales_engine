require_relative './test_helper'
require_relative '../lib/parser'

class ParserTest < Minitest::Test

  def setup
    @customer_data = Parser.parse('./fixtures/customers_fixture.csv')
    @merchant_data = Parser.parse('./fixtures/merchants_fixture.csv')
    @transaction_data = Parser.parse('./fixtures/transactions_fixture.csv')
    @item_data = Parser.parse('./fixtures/items_fixture.csv')
    @invoice_data = Parser.parse('./fixtures/invoices_fixture.csv')
    @invoice_item_data = Parser.parse('./fixtures/invoice_items_fixture.csv')
  end

  def test_it_exists
    assert @customer_data
    assert @merchant_data
    assert @transaction_data
    assert @item_data
    assert @invoice_data
    assert @invoice_item_data
  end

  def test_file_can_be_loaded_in
    assert_equal 7, @customer_data.size
  end

  def test_customer_file_can_be_laoded_in_and_parsed
    assert_equal "1", @customer_data[0][:id]
    assert_equal "2012-03-27 14:58:15 UTC", @customer_data[-1][:updated_at]
  end

  def test_merchant_file_can_be_loaded_in_and_extract_merchant_data
    assert_equal "2012-03-27 14:53:59 UTC", @merchant_data[0][:created_at]
    assert_equal "2012-03-27 14:54:09 UTC", @merchant_data[-1][:updated_at]
  end

  def test_transaction_file_can_be_loaded_in_and_extract_transaction_data
    assert_equal nil, @transaction_data[0][:credit_card_expiration_date]
    assert_equal "4843", @transaction_data[-1][:invoice_id]
  end

  def test__item_file_can_be_loaded_in_and_extract_item_data
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", @item_data[0][:description]
    assert_equal "2012-03-27 14:54:09 UTC", @item_data[-1][:updated_at]
  end

  def test_invoice_file_can_be_loaded_in_and_extract_invoice_data
    assert_equal "26", @invoice_data[0][:merchant_id]
    assert_equal "shipped", @invoice_data[-1][:status]
  end

  def test_invoice_item_file_can_be_loaded_in_and_extract_invoice_item_data
    assert_equal "539", @invoice_item_data[0][:item_id]
    assert_equal "5", @invoice_item_data[-1][:quantity]
  end

end

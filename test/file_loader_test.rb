require_relative './test_helper'
require_relative '../lib/file_loader'

class FileLoaderTest < Minitest::Test

  def setup
    @customer_data = FileLoader.parse('./fixtures/customers.csv')
    @merchant_data = FileLoader.parse('./fixtures/merchants.csv')
    @transaction_data = FileLoader.parse('./fixtures/transactions.csv')
    @item_data = FileLoader.parse('./fixtures/items.csv')
    @invoice_data = FileLoader.parse('./fixtures/invoices.csv')
    @invoice_item_data = FileLoader.parse('./fixtures/invoice_items.csv')
  end

  def test_it_exists
    assert @customer_data
    assert @merchant_data
    assert @transaction_data
    assert @item_data
    assert @invoice_data
    assert @invoice_item_data
  end

  def test_it_loads
    assert_equal "Alexander", @customer_data.to_a[1][:first_name]
    assert_equal "95", @merchant_data.to_a[1][:id]
    assert_equal "5592", @transaction_data.to_a[2][:id]
    assert_equal "2479", @item_data.to_a[2][:id]
    assert_equal "4838", @invoice_data.to_a[1][:id]
    assert_equal "21683", @invoice_item_data.to_a[1][:id]
  end

end

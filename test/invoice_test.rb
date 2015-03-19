require_relative './test_helper'
require_relative '../lib/invoice'
require_relative '../lib/sales_engine'
require_relative '../lib/item'
class InvoiceTest < Minitest::Test
  attr_reader :data
  def setup
    @data = {
              id:     "1",
              customer_id: "1",
              merchant_id: "25",
              status: "shipped",
              created_at: "2012-03-25 09:54:09 UTC",
              updated_at: "2012-03-25 09:54:09 UTC"
              }
  end

  def test_it_returns_item_through_invoice_item
    sales_engine = SalesEngine.new("./fixtures")
    sales_engine.startup
    assert_equal 1, sales_engine.invoice_repository.invoices[0].items.size
  end

  def test_it_can_call_up_to_repository_with_customer
    parent = Minitest::Mock.new
    invoice = Invoice.new(data,parent)
    parent.expect(:find_by_customer, [1,2], [1])
    assert_equal [1,2], invoice.customer
    parent.verify
  end

  def test_it_can_call_up_to_repository_with_customer
    parent = Minitest::Mock.new
    invoice = Invoice.new(data,parent)
    parent.expect(:find_transactions_by_id, [3,5], [1])
    assert_equal [3,5], invoice.transactions
    parent.verify
  end

  def test_it_can_call_up_to_repository_to_find_invoice_items_by_id
    parent = Minitest::Mock.new
    invoice = Invoice.new(data,parent)
    parent.expect(:find_invoice_items_by_id, ["pasta"], [1])
    assert_equal ["pasta"], invoice.invoice_items
    parent.verify
  end

  def test_it_can_call_up_to_repository_to_find_merchant_items_by_id
    parent = Minitest::Mock.new
    invoice = Invoice.new(data,parent)
    parent.expect(:find_merchant_by_id, ["sauce"], [1])
    assert_equal ["sauce"], invoice.merchant
    parent.verify
  end

  def test_it_can_call_up_to_repository_to_find_merchant_items_by_id
    parent = Minitest::Mock.new
    invoice = Invoice.new(data,parent)
    parent.expect(:find_merchant_by_id, ["sauce"], [1])
    assert_equal ["sauce"], invoice.merchant
    parent.verify
  end

  def test_id
    invoice = Invoice.new(data, nil)
    assert_equal 1, invoice.id
  end

  def test_customer_id
    invoice = Invoice.new(data, nil)
    assert_equal 1, invoice.customer_id
  end

  def test_merchant_id
    invoice = Invoice.new(data, nil)
    assert_equal 25, invoice.merchant_id
  end

  def test_status
    invoice = Invoice.new(data, nil)
    assert_equal "shipped", invoice.status
  end

  def test_created_at
    invoice = Invoice.new(data, nil)
    assert_equal 25, invoice.created_at.mday
  end

  def test_updated_at
    invoice = Invoice.new(data, nil)
    assert_equal 25, invoice.updated_at.mday
  end

  def test_add_items
    sales_engine = SalesEngine.new("./fixtures")
    sales_engine.startup
    customer_data = { id: "100000", first_name: "bill", last_name: "peters",
      created_at: "#{Time.now}", updated_at: "#{Time.now}" }
    merchant_data = {id: "1000000", name: "Hogwarts",created_at: "#{Time.now}",
      updated_at: "#{Time.now}" }
    item_data = { id: "4000000", name: "fish", description: "cool",
      unit_price: "76400", merchant_id: "1000000", created_at: "#{Time.now}",
      updated_at: "#{Time.now}" }
    item = Item.new(item_data, sales_engine.item_repository)
    customer = Customer.new(customer_data, sales_engine.customer_repository)
    merchant = Merchant.new(merchant_data, sales_engine.merchant_repository)
    input = {customer: customer, merchant: merchant, status: "shipped",
      items: [item, item, item] }
    invoice = sales_engine.invoice_repository.create(input)

    result = invoice.add_items(input[:items])
    assert_equal [[item, 3]], result
  end
end

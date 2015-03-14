require_relative 'test_helper'
require_relative '../lib/invoice_item'

class InvoiceItemTest < MiniTest::Test
  attr_reader :data
  def setup
    @data = { id: "1",
             item_id: "539",
             invoice_id: "1",
             quantity: "5",
             unit_price: "13635",
             created_at: "2012-03-27 14:54:09 UTC",
             updated_at: "2012-03-27 14:54:09 UTC"
             }
  end

  def test_it_can_call_up_to_repository_with_invoice_id
    parent = Minitest::Mock.new
    invoice_item = InvoiceItem.new(data,parent)
    parent.expect(:find_invoice_by_invoice_id, ["pop"], ["1"])
    assert_equal ["pop"], invoice_item.invoice
    parent.verify
  end

  def test_it_can_call_up_to_repository_with_item_id
    parent = Minitest::Mock.new
    invoice_item = InvoiceItem.new(data,parent)
    parent.expect(:find_item_by_item_id, ["boom"], ["539"])
    assert_equal ["boom"], invoice_item.item
    parent.verify
  end

  def test_id
    invoice_item = InvoiceItem.new(data, nil)
    assert_equal "1", invoice_item.id
  end

  def test_returns_item_id
    invoice_item = InvoiceItem.new(data, nil)
    assert_equal "539", invoice_item.item_id
  end

  def test_returns_invoice_id
    invoice_item = InvoiceItem.new(data, nil)
    assert_equal "1", invoice_item.invoice_id
  end

  def test_returns_quantity
    invoice_item = InvoiceItem.new(data, nil)
    assert_equal "5", invoice_item.quantity
  end

  def test_returns_unit_price
    invoice_item = InvoiceItem.new(data, nil)
    assert_equal "13635", invoice_item.unit_price
  end

  def test_returns_created_at_date
    invoice_item = InvoiceItem.new(data, nil)
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.created_at
  end

  def test_returns_updated_at_date
    invoice_item = InvoiceItem.new(data, nil)
    assert_equal "2012-03-27 14:54:09 UTC", invoice_item.updated_at
  end
end

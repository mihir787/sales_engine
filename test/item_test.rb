require_relative 'test_helper'
require_relative "../lib/item"
require_relative "../lib/sales_engine"
require 'bigdecimal'
require 'bigdecimal/util'

class ItemTest < MiniTest::Test
  attr_reader :sales_engine

  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup

    @data = { id: "1", name: "Parker", description: "Fat", unit_price: "7690", merchant_id: "456",
      created_at: "2012-03-27 14:54:10 UTC", updated_at: "2012-03-27 14:54:10 UTC" }
  end

  def test_it_returns_best_day
    @sales_engine = SalesEngine.new("./data")
    @sales_engine.startup
    item = sales_engine.item_repository.items[6]
    assert_equal "2012-03-22", item.best_day.to_s
  end

  def test_id
    result = sales_engine.item_repository.find_by_id(2481)
    assert_equal 2481, result.id
  end

  def test_name
    result = sales_engine.item_repository.find_by_id(2481)
    assert_equal "Item Sit Esse", result.name
  end

  def test_description
    result = sales_engine.item_repository.find_by_id(2481)
    assert_equal "Natus soluta qui consequatur repellat beatae aspernatur. Qui fuga sed velit. Vitae rerum suscipit quidem sed unde.", result.description
  end

  def test_unit_price
    result = sales_engine.item_repository.find_by_id(2481)
    assert_equal (92637.to_d)/100, result.unit_price
  end

  def test_merchant_id
    result = sales_engine.item_repository.find_by_id(2481)
    assert_equal 100, result.merchant_id
  end

  def test_created_at
    result = sales_engine.item_repository.find_by_id(2481)
    assert_equal 27, result.created_at.mday
  end

  def test_updated_at
    result = sales_engine.item_repository.find_by_id(2481)
    assert_equal 27, result.updated_at.mday
  end

  def test_it_can_call_up_to_repository_with_item_id
    parent = Minitest::Mock.new
    item = Item.new(@data, parent)
    parent.expect(:find_invoice_items, ["pizza", "burgers"], [1])
    assert_equal ["pizza", "burgers"], item.invoice_items
    parent.verify
  end

  def test_it_can_call_up_to_repository_with_merchant_id
    parent = Minitest::Mock.new
    item = Item.new(@data, parent)
    parent.expect(:find_merchant, ["michael"], [456])
    assert_equal ["michael"], item.merchant
    parent.verify
  end


end

require_relative 'test_helper'
require_relative "../lib/item"
require_relative "../lib/sales_engine"

class ItemTest < MiniTest::Test
  attr_reader :sales_engine

  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
  end


  def test_id
    result = sales_engine.item_repository.find_by_id("2481")
    assert_equal "2481", result.id
  end

  def test_name
    result = sales_engine.item_repository.find_by_id("2481")
    assert_equal "Item Sit Esse", result.name
  end

  def test_description
    result = sales_engine.item_repository.find_by_id("2481")
    assert_equal "Natus soluta qui consequatur repellat beatae aspernatur. Qui fuga sed velit. Vitae rerum suscipit quidem sed unde.", result.description
  end

  def test_unit_price
    result = sales_engine.item_repository.find_by_id("2481")
    assert_equal "92637", result.unit_price
  end

  def test_merchant_id
    result = sales_engine.item_repository.find_by_id("2481")
    assert_equal "100", result.merchant_id
  end

  def test_created_at
    result = sales_engine.item_repository.find_by_id("2481")
    assert_equal "2012-03-27 14:54:09 UTC", result.created_at
  end

  def test_updated_at
    result = sales_engine.item_repository.find_by_id("2481")
    assert_equal "2012-03-27 14:54:09 UTC", result.updated_at
  end
end

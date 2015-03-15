require_relative 'test_helper'
require_relative '../lib/item_repository'
require_relative '../lib/sales_engine'

class ItemRepositoryTest < Minitest::Test
  attr_reader :sales_engine

  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
  end

  def test_returns_all_item_invoices
    assert_equal 7, sales_engine.item_repository.all.count
  end

  def test_returns_random_item
    sample = []
    sample << sales_engine.item_repository.random
    assert_equal 1, sample.length
  end

  def test_returns_item_with_matching_id
    result = sales_engine.item_repository.find_by_id("2480")
    assert_equal "2480", result.id
  end

  def test_returns_item_with_matching_name
    result = sales_engine.item_repository.find_by_name("Item Sint Et")
    assert_equal "Item Sint Et", result.name
  end

  def test_returns_item_with_matching_description
    result = sales_engine.item_repository.find_by_description("Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.")
    assert_equal "Nihil autem sit odio inventore deleniti. Est laudantium ratione distinctio laborum. Minus voluptatem nesciunt assumenda dicta voluptatum porro.", result.description
  end

  def test_returns_item_with_matching_unit_price
    result = sales_engine.item_repository.find_by_unit_price("50000")
    assert_equal "50000", result.unit_price
  end

  def test_returns_item_with_matching_merchant_id
    result = sales_engine.item_repository.find_by_merchant_id("100")
    assert_equal "100", result.merchant_id
  end

  def test_returns_item_with_matching_created_at_date
    result = sales_engine.item_repository.find_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", result.created_at
  end

  def test_returns_item_with_matching_updated_at_date
    result = sales_engine.item_repository.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", result.updated_at
  end

  def test_returns_all_items_with_matching_id
    result = sales_engine.item_repository.find_all_by_id("2481")
    assert_equal 1, result.count
  end

  def test_returns_all_items_with_matching_name
    result = sales_engine.item_repository.find_all_by_name("Item Fuga Est")
    assert_equal 1, result.count
  end

  def test_returns_all_items_with_matching_description
    result = sales_engine.item_repository.find_all_by_description("Natus soluta qui consequatur repellat beatae aspernatur. Qui fuga sed velit. Vitae rerum suscipit quidem sed unde.")
    assert_equal 1, result.count
  end

  def test_returns_all_items_with_matching_unit_price
    result = sales_engine.item_repository.find_all_by_unit_price("70767")
    assert_equal 1, result.count
  end

  def test_returns_all_items_with_merchant_id
    result = sales_engine.item_repository.find_all_by_merchant_id("100")
    assert_equal 6, result.count
    assert_equal "2481", result[3].id
  end

  def test_returns_all_items_with_matching_created_at
    result = sales_engine.item_repository.find_all_by_created_at("2012-03-27 14:54:09 UTC")
    assert_equal 6, result.count
    assert_equal "2481", result[3].id
  end

  def test_returns_all_items_with_matching_updated_at
    result = sales_engine.item_repository.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal 6, result.count
    assert_equal "2481", result[3].id
  end

  def test_it_can_call_up_to_parent_to_find_invoice_items
    parent = Minitest::Mock.new
    item_repository = ItemRepository.new(parent)
    parent.expect(:item_find_invoice_items_by_item_id, "rex", ["121"])
    assert_equal "rex", item_repository.find_invoice_items("121")
  end

  def test_it_can_call_up_to_parent_to_find_merchant
    parent = Minitest::Mock.new
    item_repository = ItemRepository.new(parent)
    parent.expect(:item_find_merchant_by_merchant_id, "crystal", ["420"])
    assert_equal "crystal", item_repository.find_merchant("420")
  end
end

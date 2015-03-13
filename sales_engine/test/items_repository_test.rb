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

  # def test_returns_item_with_matching_unit_price
  #   result =
      # assert_equal "", sales_engine.item_repository.find_by_unit_price("30")
  # end
  #
  # def test_returns_item_with_matching_merchant_id
  #   result =
      # assert_equal "", sales_engine.item_repository.find_by_merchant_id("1234")
  # end
  #
  # def test_returns_item_with_matching_created_at_date
  #   result =
      # assert_equal "", sales_engine.item_repository.find_by_created_at("02/02/02")
  # end
  #
  # def test_returns_item_with_matching_updated_at_date
  #   result =
      # assert_equal "", sales_engine.item_repository.find_by_updated_at("10/05/15")
  # end
  #
  # def test_returns_all_items_with_matching_id
  #   result =
      # assert_equal "", sales_engine.item_repository.find_all_by_id("1234")
  # end
  #
  # def test_returns_all_items_with_matching_name
  #   result =
      # assert_equal "", sales_engine.item_repository.find_all_by_name("mike")
  # end
  #
  # def test_returns_all_items_with_matching_description
  #   result =
      # assert_equal "", sales_engine.item_repository.find_all_by_description("big")
  # end
  #
  # def test_returns_all_items_with_matching_unit_price
  #   result =
      # assert_equal "", sales_engine.item_repository.find_all_by_unit_price("100")
  # end
  #
  # def test_returns_all_items_with_merchant_id
  #   result =
      # assert_equal "", sales_engine.item_repository.find_all_by_merchant_id("1234")
  # end
  #
  # def test_returns_all_items_with_matching_created_at
  #   result =
      # assert_equal "", sales_engine.item_repository.find_all_by_created_at("05/05/95")
  # end
  #
  # def test_returns_all_items_with_matching_updated_at
  #   result =
      # assert_equal "", sales_engine.item_repository.find_all_by_updated_at("05/10/95")
  # end
end

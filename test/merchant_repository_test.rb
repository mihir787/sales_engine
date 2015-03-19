require_relative 'test_helper'
require_relative '../lib/sales_engine'
require_relative '../lib/merchant_repository'
require 'bigdecimal'
require 'bigdecimal/util'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :sales_engine, :sales_engine1

  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
    @sales_engine1 = SalesEngine.new("./data")
    @sales_engine1.startup
  end

  def test_it_can_call_up_to_sales_engine_with_id_to_find_item
    parent = Minitest::Mock.new
    merchant_repo = MerchantRepository.new(parent)
    parent.expect(:merchant_find_item_by_id, "pretzel", [9])
    assert_equal "pretzel", merchant_repo.find_item_by_id(9)
    parent.verify
  end

  def test_it_can_call_up_to_sales_engine_with_id_to_find_invoice
    parent = Minitest::Mock.new
    merchant_repo = MerchantRepository.new(parent)
    parent.expect(:merchant_find_invoice_by_id, "pretzel", [9])
    assert_equal "pretzel", merchant_repo.find_invoice_by_id(9)
    parent.verify
  end

  def test_returns_all_merchant
    assert_equal 7, sales_engine.merchant_repository.all.count
  end

  def test_returns_random_merchant
    sample = []
    sample << sales_engine.merchant_repository.random
    assert_equal 1, sample.length
  end

  def test_returns_merchant_with_matching_name
    result = sales_engine.merchant_repository.find_by_name("Rice, Jerde and White")
    assert_equal "Rice, Jerde and White", result.name
  end

  def test_returns_merchant_with_matching_created_at_date
    result = sales_engine.merchant_repository.find_by_created_at(Date.parse("2012-03-27 14:54:08 UTC"))
    assert_equal 1, result.id
  end

  def test_returns_merchant_with_matching_updated_at_date
    result = sales_engine.merchant_repository.find_by_updated_at(Date.parse("2012-03-27 14:54:09 UTC"))
    assert_equal 1, result.id
  end

  def test_returns_all_merchants_with_matching_name
    result = sales_engine.merchant_repository.find_all_by_name("Okuneva, Prohaska and Rolfson")
    assert_equal 1, result.count
  end

  def test_returns_all_merchants_with_matching_id_name
    result = sales_engine.merchant_repository.find_all_by_id(99)
    assert_equal 1, result.count
  end

  def test_returns_all_merchants_with_matching_created_at_date
    result = sales_engine.merchant_repository.find_all_by_created_at(Date.parse("2012-03-27 14:54:08 UTC"))
    assert_equal 7, result.count
  end

  def test_returns_all_merchants_with_matching_updated_at_date
    result = sales_engine.merchant_repository.find_all_by_updated_at(Date.parse("2012-03-27 14:54:09 UTC"))
    assert_equal 7, result.count
  end

  def test_returns_merchant_id
    result = sales_engine.merchant_repository.find_by_id(2)
    assert_equal "Wisozk, Hoeger and Bosco", result.name
  end

  def test_returns_top_2_merchants_with_most_revenue
    top_revenue = sales_engine1.merchant_repository.most_revenue(2)
    assert_equal "Dicki-Bednar", top_revenue[0].name
    assert_equal "Kassulke, O'Hara and Quitzon", top_revenue[1].name
  end

  def test_most_items
    result = sales_engine1.merchant_repository.most_items(2)
    assert_equal "Kassulke, O'Hara and Quitzon", result[0].name
    assert_equal "Kozey Group", result[1].name
  end

  def test_find_total_revenue_for_the_date
    result = sales_engine1.merchant_repository.revenue(Date.parse("2012-03-27 14:54:09 UTC"))
    assert_equal 1908368, result.to_i
  end

end

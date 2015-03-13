require_relative 'test_helper'
require_relative '../lib/sales_engine'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test
  attr_reader :sales_engine

  def setup
    @sales_engine = SalesEngine.new("./fixtures")
    @sales_engine.startup
  end

  def test_it_can_call_up_to_sales_engine_with_id_to_find_item
    parent = Minitest::Mock.new
    merchant_repo = MerchantRepository.new(parent)
    parent.expect(:merchant_find_item_by_id, "pretzel", ["9"])
    assert_equal "pretzel", merchant_repo.find_item_by_id("9")
    parent.verify
  end

  def test_it_can_call_up_to_sales_engine_with_id_to_find_invoice
    parent = Minitest::Mock.new
    merchant_repo = MerchantRepository.new(parent)
    parent.expect(:merchant_find_invoice_by_id, "pretzel", ["9"])
    assert_equal "pretzel", merchant_repo.find_invoice_by_id("9")
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
    result = sales_engine.merchant_repository.find_by_created_at("2012-03-27 14:54:08 UTC")
    assert_equal "2012-03-27 14:54:08 UTC", result.created_at
    assert_equal "95", result.id
  end

  def test_returns_merchant_with_matching_updated_at_date
    result = sales_engine.merchant_repository.find_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal "2012-03-27 14:54:09 UTC", result.updated_at
    assert_equal "97", result.id
  end

  def test_returns_all_merchants_with_matching_name
    result = sales_engine.merchant_repository.find_all_by_name("Okuneva, Prohaska and Rolfson")
    assert_equal 1, result.count
  end

  def test_returns_all_merchants_with_matching_id_name
    result = sales_engine.merchant_repository.find_all_by_id("99")
    assert_equal 1, result.count
  end

  def test_returns_all_merchants_with_matching_created_at_date
    result = sales_engine.merchant_repository.find_all_by_created_at("2012-03-27 14:54:08 UTC")
    assert_equal 2, result.count
  end

  def test_returns_all_merchants_with_matching_updated_at_date
    result = sales_engine.merchant_repository.find_all_by_updated_at("2012-03-27 14:54:09 UTC")
    assert_equal 4, result.count
  end

  def test_returns_merchant_id
    result = sales_engine.merchant_repository.find_by_id("100")
    assert_equal "100", result.id
  end

end

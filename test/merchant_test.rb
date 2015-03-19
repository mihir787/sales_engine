require_relative 'test_helper'
require_relative '../lib/merchant'
require_relative '../lib/sales_engine'
require 'bigdecimal'
require 'bigdecimal/util'
require 'date'

class MerchantTest < Minitest::Test
  attr_accessor :data
  def setup
    @data = {
              id: "9",
              name: "Hand-Spencer",
              created_at: "2012-03-27 14:53:59 UTC",
              updated_at: "2012-03-27 14:53:59 UTC"
              }
  end

  def test_it_can_return_favorite_customer
    sales_engine = SalesEngine.new("./fixtures")
    sales_engine.startup
    merchant = sales_engine.merchant_repository.merchants[1]
    assert_equal "Joey", merchant.favorite_customer.first_name
  end

  def test_it_can_return_total_revenue
    sales_engine = SalesEngine.new("./fixtures")
    sales_engine.startup
    merchant = sales_engine.merchant_repository.merchants[1]
    assert_equal 136, merchant.revenue.to_i
    assert_equal 0, merchant.revenue(Date.parse("2012-03-27 14:53:59 UTC")).to_i
  end

  def test_it_can_call_up_to_repository_with_id_to_find_item
    parent = Minitest::Mock.new
    merchant = Merchant.new(data,parent)
    parent.expect(:find_item_by_id, "taco", [9])
    assert_equal "taco", merchant.items
    parent.verify
  end

  def test_it_can_call_up_to_repository_with_id_to_find_invoice
    parent = Minitest::Mock.new
    merchant = Merchant.new(data,parent)
    parent.expect(:find_invoice_by_id, "pretzel", [9])
    assert_equal "pretzel", merchant.invoices
    parent.verify
  end

  def test_id
    @merchant = Merchant.new(data, nil)
    assert_equal 9, @merchant.id
  end

  def test_name
    @merchant = Merchant.new(data, nil)
    assert_equal "Hand-Spencer", @merchant.name
  end

  def test_created_at
    @merchant = Merchant.new(data, nil)
    assert_equal 27, @merchant.created_at.mday
  end

  def test_updated_at
    @merchant = Merchant.new(data, nil)
    assert_equal 27, @merchant.updated_at.mday
  end

end

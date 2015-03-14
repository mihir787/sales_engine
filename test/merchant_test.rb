require_relative 'test_helper'
require_relative '../lib/merchant'

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

  def test_it_can_call_up_to_repository_with_id_to_find_item
    parent = Minitest::Mock.new
    merchant = Merchant.new(data,parent)
    parent.expect(:find_item_by_id, "taco", ["9"])
    assert_equal "taco", merchant.items
    parent.verify
  end

  def test_it_can_call_up_to_repository_with_id_to_find_invoice
    parent = Minitest::Mock.new
    merchant = Merchant.new(data,parent)
    parent.expect(:find_invoice_by_id, "pretzel", ["9"])
    assert_equal "pretzel", merchant.invoices
    parent.verify
  end

  def test_id
    @merchant = Merchant.new(data, nil)
    assert_equal "9", @merchant.id
  end

  def test_name
    @merchant = Merchant.new(data, nil)
    assert_equal "Hand-Spencer", @merchant.name
  end

  def test_created_at
    @merchant = Merchant.new(data, nil)
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.created_at
  end

  def test_updated_at
    @merchant = Merchant.new(data, nil)
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.updated_at
  end

end

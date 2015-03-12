require_relative 'test_helper'
require_relative '../lib/merchant'

class MerchantTest < Minitest::Test

  def setup
    data = { id: "9", name: "Hand-Spencer", created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC" }

    @merchant = Merchant.new(data)
  end

  def test_id
    assert_equal "9", @merchant.id
  end

  def test_name
    assert_equal "Hand-Spencer", @merchant.name
  end

  def test_created_at
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.created_at
  end

  def test_updated_at
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.updated_at
  end

end

require_relative 'test_helper'
require_relative '../lib/merchant_repository'

class MerchantRepositoryTest < Minitest::Test

  def test_returns_all_merchant
    merchant1 = Merchant.new(:name => "bobby")
    merchant2 = Merchant.new(:name => "mike")
    merchants = [merchant1, merchant2]
    merchant_repo = MerchantRepository.new(merchants)
    assert_equal [merchant1, merchant2], merchant_repo.all
  end

  def test_returns_random_merchant
    merchant1 = Merchant.new(:name => "bobby")
    merchant2 = Merchant.new(:name => "mike")
    merchants = [merchant1, merchant2]
    merchant_repo = MerchantRepository.new(merchants)
    sample = []
    sample << merchant_repo.random
    assert_equal 1, sample.length
  end

  def test_returns_merchant_with_matching_name
    merchant1 = Merchant.new(:name => "bobby")
    merchant2 = Merchant.new(:name => "john")
    merchants = [merchant1, merchant2]
    merchant_repo = MerchantRepository.new(merchants)
    assert_equal merchant1, merchant_repo.find_by_name("bobby")
  end

  def test_returns_merchant_with_matching_created_at_date
    merchant1 = Merchant.new(:created_at => "01/02/15")
    merchant2 = Merchant.new(:created_at => "10/05/15")
    merchants = [merchant1, merchant2]
    merchant_repo = MerchantRepository.new(merchants)
    assert_equal merchant2, merchant_repo.find_by_created_at("10/05/15")
  end

  def test_returns_merchant_with_matching_updated_at_date
    merchant1 = Merchant.new(:updated_at => "01/02/15")
    merchant2 = Merchant.new(:updated_at => "10/05/15")
    merchants = [merchant1, merchant2]
    merchant_repo = MerchantRepository.new(merchants)
    assert_equal merchant2, merchant_repo.find_by_updated_at("10/05/15")
  end

  def test_returns_all_merchants_with_matching_name
    merchant1 = Merchant.new(:name => "bobby")
    merchant2 = Merchant.new(:name => "mike")
    merchant3 = Merchant.new(:name => "bobby")
    merchant4 = Merchant.new(:name => "john")
    merchants = [merchant1, merchant2, merchant3, merchant4]
    merchant_repo = MerchantRepository.new(merchants)
    assert_equal [merchant1, merchant3], merchant_repo.find_all_by_name("bobby")
  end

  def test_returns_all_merchants_with_matching_id_name
    merchant1 = Merchant.new(:id => "12345")
    merchant2 = Merchant.new(:id => "99999")
    merchant3 = Merchant.new(:id => "88888")
    merchant4 = Merchant.new(:id => "12345")
    merchants = [merchant1, merchant2, merchant3, merchant4]
    merchant_repo = MerchantRepository.new(merchants)
    assert_equal [merchant1, merchant4], merchant_repo.find_all_by_id("12345")
  end

  def test_returns_all_merchants_with_matching_created_at_date
    merchant1 = Merchant.new(:created_at => "10/05/15")
    merchant2 = Merchant.new(:created_at => "02/05/15")
    merchant3 = Merchant.new(:created_at => "04/05/15")
    merchant4 = Merchant.new(:created_at => "10/05/15")
    merchants = [merchant1, merchant2, merchant3, merchant4]
    merchant_repo = MerchantRepository.new(merchants)
    assert_equal [merchant1, merchant4], merchant_repo.find_all_by_created_at("10/05/15")
  end

  def test_returns_all_merchants_with_matching_updated_at_date
    merchant1 = Merchant.new(:updated_at => "12/05/15")
    merchant2 = Merchant.new(:updated_at => "04/05/15")
    merchant3 = Merchant.new(:updated_at => "04/05/15")
    merchant4 = Merchant.new(:updated_at => "06/05/15")
    merchants = [merchant1, merchant2, merchant3, merchant4]
    merchant_repo = MerchantRepository.new(merchants)
    assert_equal [merchant2, merchant3], merchant_repo.find_all_by_updated_at("04/05/15")
  end

  def test_returns_merchant_id
    merchant1 = Merchant.new(:id => "12345")
    merchant2 = Merchant.new(:id => "99999")
    merchants = [merchant1, merchant2]
    merchant_repo = MerchantRepository.new(merchants)
    assert_equal merchant1, merchant_repo.find_by_id("12345")
  end

end

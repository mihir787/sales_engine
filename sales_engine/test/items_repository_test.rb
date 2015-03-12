require_relative 'test_helper'
require_relative '../lib/items_repository'

class InvoiceItemRepositoryTest < Minitest::Test
  def test_returns_all_item_invoices
    item1 = Item.new(:id => "123")
    item2 = Item.new(:id => "321")
    items = [item1, item2]
    items_repo = ItemRepository.new(items)
    assert_equal [item1, item2], items_repo.all
  end

  def test_returns_random_item
    item1 = Item.new(:id => "123")
    item2 = Item.new(:id => "321")
    items = [item1, item2]
    items_repo = ItemRepository.new(items)
    sample = []
    sample << items_repo.random
    assert_equal 1, sample.length
  end

  def test_returns_item_with_matching_id
    item1 = Item.new(:id => "5321")
    item2 = Item.new(:id => "1234")
    items = [item1, item2]
    items_repo = ItemRepository.new(items)
    assert_equal item1, items_repo.find_by_id("5321")
  end

  def test_returns_item_with_matching_name
    item1 = Item.new(:name => "mike")
    item2 = Item.new(:name => "mark")
    items = [item1, item2]
    items_repo = ItemRepository.new(items)
    assert_equal item2, items_repo.find_by_name("mark")
  end

  def test_returns_item_with_matching_description
    item1 = Item.new(:description => "sturdy")
    item2 = Item.new(:description => "fragile")
    items = [item1, item2]
    items_repo = ItemRepository.new(items)
    assert_equal item1, items_repo.find_by_description("sturdy")
  end

  def test_returns_item_with_matching_unit_price
    item1 = Item.new(:unit_price => "25")
    item2 = Item.new(:unit_price => "30")
    items = [item1, item2]
    items_repo = ItemRepository.new(items)
    assert_equal item2, items_repo.find_by_unit_price("30")
  end

  def test_returns_item_with_matching_merchant_id
    item1 = Item.new(:merchant_id => "5321")
    item2 = Item.new(:merchant_id => "1234")
    items = [item1, item2]
    items_repo = ItemRepository.new(items)
    assert_equal item2, items_repo.find_by_merchant_id("1234")
  end

  def test_returns_item_with_matching_created_at_date
    item1 = Item.new(:created_at => "12/12/12")
    item2 = Item.new(:created_at => "02/02/02")
    items = [item1, item2]
    items_repo = ItemRepository.new(items)
    assert_equal item2, items_repo.find_by_created_at("02/02/02")
  end

  def test_returns_item_with_matching_updated_at_date
    item1 = Item.new(:updated_at => "04/02/12")
    item2 = Item.new(:updated_at => "10/05/15")
    items = [item1, item2]
    items_repo = ItemRepository.new(items)
    assert_equal item2, items_repo.find_by_updated_at("10/05/15")
  end

  def test_returns_all_items_with_matching_id
    item1 = Item.new(:id => "1234")
    item2 = Item.new(:id => "5321")
    item3 = Item.new(:id => "1234")
    item4 = Item.new(:id => "9999")
    items = [item1, item2, item3, item4]
    items_repo = ItemRepository.new(items)
    assert_equal [item1,item3], items_repo.find_all_by_id("1234")
  end

  def test_returns_all_items_with_matching_name
    item1 = Item.new(:name => "mike")
    item2 = Item.new(:name => "ben")
    item3 = Item.new(:name => "mark")
    item4 = Item.new(:name => "mike")
    items = [item1, item2, item3, item4]
    items_repo = ItemRepository.new(items)
    assert_equal [item1,item4], items_repo.find_all_by_name("mike")
  end

  def test_returns_all_items_with_matching_description
    item1 = Item.new(:description => "big")
    item2 = Item.new(:description => "small")
    item3 = Item.new(:description => "big")
    item4 = Item.new(:description => "tall")
    items = [item1, item2, item3, item4]
    items_repo = ItemRepository.new(items)
    assert_equal [item1,item3], items_repo.find_all_by_description("big")
  end

  def test_returns_all_items_with_matching_unit_price
    item1 = Item.new(:unit_price => "100")
    item2 = Item.new(:unit_price => "200")
    item3 = Item.new(:unit_price => "300")
    item4 = Item.new(:unit_price => "100")
    items = [item1, item2, item3, item4]
    items_repo = ItemRepository.new(items)
    assert_equal [item1,item4], items_repo.find_all_by_unit_price("100")
  end

  def test_returns_all_items_with_merchant_id
    item1 = Item.new(:merchant_id => "5321")
    item2 = Item.new(:merchant_id => "1234")
    item3 = Item.new(:merchant_id => "9999")
    item4 = Item.new(:merchant_id => "1234")
    items = [item1, item2, item3, item4]
    items_repo = ItemRepository.new(items)
    assert_equal [item2,item4], items_repo.find_all_by_merchant_id("1234")
  end

  def test_returns_all_items_with_matching_created_at
    item1 = Item.new(:created_at => "05/05/95")
    item2 = Item.new(:created_at => "05/05/95")
    item3 = Item.new(:created_at => "05/10/95")
    item4 = Item.new(:created_at => "05/05/95")
    items = [item1, item2, item3, item4]
    items_repo = ItemRepository.new(items)
    assert_equal [item1,item2,item4], items_repo.find_all_by_created_at("05/05/95")
  end

  def test_returns_all_items_with_matching_updated_at
    item1 = Item.new(:updated_at => "05/10/95")
    item2 = Item.new(:updated_at => "05/05/95")
    item3 = Item.new(:updated_at => "05/10/95")
    item4 = Item.new(:updated_at => "05/05/95")
    items = [item1, item2, item3, item4]
    items_repo = ItemRepository.new(items)
    assert_equal [item1,item3], items_repo.find_all_by_updated_at("05/10/95")
  end
end

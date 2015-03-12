require_relative 'test_helper'
require_relative '../lib/invoice_item_repository'

class InvoiceItemRepositoryTest < Minitest::Test
  # def test_returns_all_item_invoices
  #   invoice_item1 = InvoiceItem.new(:id => "123")
  #   invoice_item2 = InvoiceItem.new(:id => "321")
  #   invoice_items = [invoice_item1, invoice_item2]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal [invoice_item1, invoice_item2], invoice_item_repo.all
  # end
  #
  # def test_returns_random_invoice
  #   invoice_item1 = InvoiceItem.new(:id => "123")
  #   invoice_item2 = InvoiceItem.new(:id => "321")
  #   invoice_items = [invoice_item1, invoice_item2]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   sample = []
  #   sample << invoice_item_repo.random
  #   assert_equal 1, sample.length
  # end
  #
  # def test_returns_invoice_item_with_matching_id
  #   invoice_item1 = InvoiceItem.new(:id => "5321")
  #   invoice_item2 = InvoiceItem.new(:id => "1234")
  #   invoice_items = [invoice_item1, invoice_item2]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal invoice_item1, invoice_item_repo.find_by_id("5321")
  # end
  #
  # def test_returns_invoice_item_with_matching_invoice_id
  #   invoice_item1 = InvoiceItem.new(:invoice_id => "5321")
  #   invoice_item2 = InvoiceItem.new(:invoice_id => "1234")
  #   invoice_items = [invoice_item1, invoice_item2]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal invoice_item2, invoice_item_repo.find_by_invoice_id("1234")
  # end
  #
  # def test_returns_invoice_item_with_matching_item_id
  #   invoice_item1 = InvoiceItem.new(:item_id => "5321")
  #   invoice_item2 = InvoiceItem.new(:item_id => "1234")
  #   invoice_items = [invoice_item1, invoice_item2]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal invoice_item2, invoice_item_repo.find_by_item_id("1234")
  # end
  #
  # def test_returns_invoice_item_with_matching_quantity
  #   invoice_item1 = InvoiceItem.new(:quantity => "10")
  #   invoice_item2 = InvoiceItem.new(:quantity => "12")
  #   invoice_items = [invoice_item1, invoice_item2]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal invoice_item1, invoice_item_repo.find_by_quantity("10")
  # end
  #
  # def test_returns_invoice_item_with_matching_unit_price
  #   invoice_item1 = InvoiceItem.new(:unit_price => "25")
  #   invoice_item2 = InvoiceItem.new(:unit_price => "30")
  #   invoice_items = [invoice_item1, invoice_item2]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal invoice_item2, invoice_item_repo.find_by_unit_price("30")
  # end
  #
  # def test_returns_invoice_with_matching_created_at_date
  #   invoice_item1 = InvoiceItem.new(:created_at => "12/12/12")
  #   invoice_item2 = InvoiceItem.new(:created_at => "02/02/02")
  #   invoice_items = [invoice_item1, invoice_item2]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal invoice_item2, invoice_item_repo.find_by_created_at("02/02/02")
  # end
  #
  # def test_returns_invoice_with_matching_updated_at_date
  #   invoice_item1 = InvoiceItem.new(:updated_at => "04/02/12")
  #   invoice_item2 = InvoiceItem.new(:updated_at => "10/05/15")
  #   invoice_items = [invoice_item1, invoice_item2]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal invoice_item2, invoice_item_repo.find_by_updated_at("10/05/15")
  # end
  #
  # def test_returns_all_invoice_item_with_matching_id
  #   invoice_item1 = InvoiceItem.new(:id => "5321")
  #   invoice_item2 = InvoiceItem.new(:id => "1234")
  #   invoice_item3 = InvoiceItem.new(:id => "9999")
  #   invoice_item4 = InvoiceItem.new(:id => "1234")
  #   invoice_items = [invoice_item1, invoice_item2, invoice_item3, invoice_item4]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal [invoice_item2,invoice_item4], invoice_item_repo.find_all_by_id("1234")
  # end
  #
  # def test_returns_all_invoice_item_with_matching_item_id
  #   invoice_item1 = InvoiceItem.new(:item_id => "1234")
  #   invoice_item2 = InvoiceItem.new(:item_id => "5321")
  #   invoice_item3 = InvoiceItem.new(:item_id => "1234")
  #   invoice_item4 = InvoiceItem.new(:item_id => "9999")
  #   invoice_items = [invoice_item1, invoice_item2, invoice_item3, invoice_item4]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal [invoice_item1,invoice_item3], invoice_item_repo.find_all_by_item_id("1234")
  # end
  #
  # def test_returns_all_invoice_item_with_matching_invoice_id
  #   invoice_item1 = InvoiceItem.new(:invoice_id => "5421")
  #   invoice_item2 = InvoiceItem.new(:invoice_id => "7777")
  #   invoice_item3 = InvoiceItem.new(:invoice_id => "1234")
  #   invoice_item4 = InvoiceItem.new(:invoice_id => "7777")
  #   invoice_items = [invoice_item1, invoice_item2, invoice_item3, invoice_item4]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal [invoice_item2,invoice_item4], invoice_item_repo.find_all_by_invoice_id("7777")
  # end
  #
  # def test_returns_all_invoice_item_with_matching_quantity
  #   invoice_item1 = InvoiceItem.new(:quantity => "25")
  #   invoice_item2 = InvoiceItem.new(:quantity => "78")
  #   invoice_item3 = InvoiceItem.new(:quantity => "57")
  #   invoice_item4 = InvoiceItem.new(:quantity => "78")
  #   invoice_items = [invoice_item1, invoice_item2, invoice_item3, invoice_item4]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal [invoice_item2,invoice_item4], invoice_item_repo.find_all_by_quantity("78")
  # end
  #
  # def test_returns_all_invoice_item_with_matching_unit_price
  #   invoice_item1 = InvoiceItem.new(:unit_price => "100")
  #   invoice_item2 = InvoiceItem.new(:unit_price => "200")
  #   invoice_item3 = InvoiceItem.new(:unit_price => "300")
  #   invoice_item4 = InvoiceItem.new(:unit_price => "100")
  #   invoice_items = [invoice_item1, invoice_item2, invoice_item3, invoice_item4]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal [invoice_item1,invoice_item4], invoice_item_repo.find_all_by_unit_price("100")
  # end
  #
  # def test_returns_all_invoice_item_with_matching_created_at
  #   invoice_item1 = InvoiceItem.new(:created_at => "05/05/95")
  #   invoice_item2 = InvoiceItem.new(:created_at => "05/05/95")
  #   invoice_item3 = InvoiceItem.new(:created_at => "05/10/95")
  #   invoice_item4 = InvoiceItem.new(:created_at => "05/05/95")
  #   invoice_items = [invoice_item1, invoice_item2, invoice_item3, invoice_item4]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal [invoice_item1,invoice_item2,invoice_item4], invoice_item_repo.find_all_by_created_at("05/05/95")
  # end
  #
  # def test_returns_all_invoice_item_with_matching_updated_at
  #   invoice_item1 = InvoiceItem.new(:updated_at => "05/10/95")
  #   invoice_item2 = InvoiceItem.new(:updated_at => "05/05/95")
  #   invoice_item3 = InvoiceItem.new(:updated_at => "05/10/95")
  #   invoice_item4 = InvoiceItem.new(:updated_at => "05/05/95")
  #   invoice_items = [invoice_item1, invoice_item2, invoice_item3, invoice_item4]
  #   invoice_item_repo = InvoiceItemRepository.new(invoice_items)
  #   assert_equal [invoice_item1,invoice_item3], invoice_item_repo.find_all_by_updated_at("05/10/95")
  # end
  #



end

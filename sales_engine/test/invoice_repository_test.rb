require_relative 'test_helper'
require_relative '../lib/invoice_repository'

class CustomerRepositoryTest < Minitest::Test
  # def test_returns_all_invoices
  #   invoice1 = Invoice.new(:customer_id => "123")
  #   invoice2 = Invoice.new(:customer_id => "321")
  #   invoices = [invoice1, invoice2]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   assert_equal [invoice1, invoice2], invoice_repo.all
  # end
  #
  # def test_returns_random_invoice
  #   invoice1 = Invoice.new(:customer_id => "123")
  #   invoice2 = Invoice.new(:customer_id => "321")
  #   invoices = [invoice1, invoice2]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   sample = []
  #   sample << invoice_repo.random
  #   assert_equal 1, sample.length
  # end
  #
  # def test_returns_invoice_with_matching_customer_id
  #   invoice1 = Invoice.new(:customer_id => "5321")
  #   invoice2 = Invoice.new(:customer_id => "1234")
  #   invoices = [invoice1, invoice2]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   assert_equal invoice1, invoice_repo.find_by_customer_id("5321")
  # end
  #
  # def test_returns_invoice_with_matching_merchant_id
  #   invoice1 = Invoice.new(:merchant_id => "5321")
  #   invoice2 = Invoice.new(:merchant_id => "1234")
  #   invoices = [invoice1, invoice2]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   assert_equal invoice2, invoice_repo.find_by_merchant_id("1234")
  # end
  #
  # def test_returns_invoice_with_matching_status
  #   invoice1 = Invoice.new(:status => "bad")
  #   invoice2 = Invoice.new(:status => "good")
  #   invoices = [invoice1, invoice2]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   assert_equal invoice2, invoice_repo.find_by_status("good")
  # end
  #
  # def test_returns_invoice_with_matching_created_at_date
  #   invoice1 = Invoice.new(:created_at => "01/02/15")
  #   invoice2 = Invoice.new(:created_at => "10/05/15")
  #   invoices = [invoice1, invoice2]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   assert_equal invoice2, invoice_repo.find_by_created_at("10/05/15")
  # end
  #
  # def test_returns_invoice_with_matching_updated_at_date
  #   invoice1 = Invoice.new(:updated_at => "01/02/15")
  #   invoice2 = Invoice.new(:updated_at => "10/05/15")
  #   invoices = [invoice1, invoice2]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   assert_equal invoice2, invoice_repo.find_by_updated_at("10/05/15")
  # end
  #
  # def test_returns_all_invoices_with_matching_customer_id
  #   invoice1 = Invoice.new(:customer_id => "54321")
  #   invoice2 = Invoice.new(:customer_id => "54321")
  #   invoice3 = Invoice.new(:customer_id => "53999")
  #   invoice4 = Invoice.new(:customer_id => "12345")
  #   invoices = [invoice1, invoice2, invoice3, invoice4]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   assert_equal [invoice1, invoice2], invoice_repo.find_all_by_customer_id("54321")
  # end
  #
  # def test_returns_all_invoices_with_matching_merchant_id
  #   invoice1 = Invoice.new(:merchant_id => "09999")
  #   invoice2 = Invoice.new(:merchant_id => "77777")
  #   invoice3 = Invoice.new(:merchant_id => "55555")
  #   invoice4 = Invoice.new(:merchant_id => "55555")
  #   invoices = [invoice1, invoice2, invoice3, invoice4]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   assert_equal [invoice3, invoice4], invoice_repo.find_all_by_merchant_id("55555")
  # end
  #
  # def test_returns_all_invoice_with_matching_status
  #   invoice1 = Invoice.new(:status => "bad")
  #   invoice2 = Invoice.new(:status => "bad")
  #   invoice3 = Invoice.new(:status => "eh")
  #   invoice4 = Invoice.new(:status => "whompwhomp")
  #   invoices = [invoice1, invoice2,invoice3,invoice4]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   assert_equal [invoice1,invoice2], invoice_repo.find_all_by_status("bad")
  # end
  #
  # def test_returns_all_invoices_with_matching_created_at_date
  #   invoice1 = Invoice.new(:created_at => "10/05/15")
  #   invoice2 = Invoice.new(:created_at => "02/05/15")
  #   invoice3 = Invoice.new(:created_at => "04/05/15")
  #   invoice4 = Invoice.new(:created_at => "10/05/15")
  #   invoices = [invoice1, invoice2, invoice3, invoice4]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   assert_equal [invoice1, invoice4], invoice_repo.find_all_by_created_at("10/05/15")
  # end
  #
  # def test_returns_all_invoices_with_matching_updated_at_date
  #   invoice1 = Invoice.new(:updated_at => "12/05/15")
  #   invoice2 = Invoice.new(:updated_at => "04/05/15")
  #   invoice3 = Invoice.new(:updated_at => "04/05/15")
  #   invoice4 = Invoice.new(:updated_at => "06/05/15")
  #   invoices = [invoice1, invoice2, invoice3, invoice4]
  #   invoice_repo = InvoiceRepository.new(invoices)
  #   assert_equal [invoice2, invoice3], invoice_repo.find_all_by_updated_at("04/05/15")
  # end


end

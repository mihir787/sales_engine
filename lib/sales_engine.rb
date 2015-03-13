require 'csv'
require_relative 'merchant'
require_relative 'merchant_repository'
require_relative 'customer'
require_relative 'customer_repository'
require_relative 'invoice_item'
require_relative 'invoice_item_repository'
require_relative 'item'
require_relative 'item_repository'
require_relative 'invoice'
require_relative 'invoice_repository'
require_relative 'transaction'
require_relative 'transaction_repository'
require_relative 'file_loader'


class SalesEngine

  attr_reader :filepath,
              :customer_repository,
              :merchant_repository,
              :invoice_item_repository,
              :invoice_repository,
              :item_repository,
              :transaction_repository

  def initialize(filepath)
    @filepath = filepath
  end

  def startup
    @customer_repository = CustomerRepository.new(self)
    @merchant_repository = MerchantRepository.new(self)
    @invoice_item_repository = InvoiceItemRepository.new(self)
    @invoice_repository = InvoiceRepository.new(self)
    @item_repository = ItemRepository.new(self)
    @transaction_repository = TransactionRepository.new(self)

    @customer_repository.parse_data("#{@filepath}/customers.csv")
    @merchant_repository.parse_data("#{@filepath}/merchants.csv")
    @invoice_item_repository.parse_data("#{@filepath}/invoice_items.csv")
    @invoice_repository.parse_data("#{@filepath}/invoices.csv")
    @item_repository.parse_data("#{@filepath}/items.csv")
    @transaction_repository.parse_data("#{@filepath}/transactions.csv")
  end

  def invoice_find_customer_by_invoice_customer_id(id)
    @customer_repository.find_by_customer(id)
  end

  def merchant_find_item_by_id(id)
    @item_repository.find_by_item(id)
  end

  def merchant_find_invoice_by_id(id)
    @invoice_repository.find_by_merchant_id(id)
  end
end

# sales_engine = SalesEngine.new("./data")
# sales_engine.startup
# puts sales_engine.find_customer_by_invoice_customer_id

# se = SalesEngine.new("./data")
# se.startup
# puts se.customer_repository.customers.inspect

#this is from the spec
# engine.startup
#
# engine.merchant_repository
# engine.invoice_repository
# engine.item_repository
# engine.invoice_item_repository
# engine.customer_repository
# engine.transaction_repository
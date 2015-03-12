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
require_relative 'parser'


class SalesEngine

  attr_reader :filepath

  def initialize(filepath)
    @filepath = filepath
  end

  def startup
    file_path = "#{@filepath}/merchants.csv"
    @merchants = Parser.parse(file_path)
    # customers_data = Parser.parse("customers.csv")
    # merchants_data = Parser.parse("merchants.csv")
    # invoice_items_data = Parser.parse("invoice_items.csv")
    # invoices_data = Parser.parse("invoices.csv")
    # items_data = Parser.parse("items.csv")
    # transactions_data = Parser.parse("transactions.csv")
    #
    # @customer_respository = CustomerRepository.new(customers_data, self)
    # @merchant_respository = MerchantRepository.new(merchants_data, self)
    # @invoice_item_repository = InvoiceItemRepository.new(invoice_items_data, self)
    # @invoice_repository = InvoiceRepository.new(invoices_data, self)
    # @item_repository = ItemsRepository.new(invoices_data, self)
    # @transaction_repository = TransactionRepository.new(transactions_data, self)
  end
end


#this is from the spec
# engine.startup
#
# engine.merchant_repository
# engine.invoice_repository
# engine.item_repository
# engine.invoice_item_repository
# engine.customer_repository
# engine.transaction_repository

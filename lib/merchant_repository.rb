require_relative 'merchant'
require_relative 'file_loader'
require 'pry'

class MerchantRepository
  attr_reader :merchants, :sales_engine

  def initialize(sales_engine)
    @merchants = []
    @sales_engine = sales_engine
  end

  def parse_data(path)
    file = FileLoader.parse(path)
    @merchants = file.map{|data| Merchant.new(data, self)}
    file.close
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end

  def find_item_by_id(id)
    @sales_engine.merchant_find_item_by_id(id)
  end

  def find_invoice_by_id(id)
    @sales_engine.merchant_find_invoice_by_id(id)
  end

  def all
    @merchants
  end

  def random
    @merchants.sample
  end

  def find_by_id(id)
    @merchants.find{|merchant| merchant.id == id}
  end

  def find_by_name(name)
    @merchants.find{|merchant| merchant.name == name}
  end

  def find_by_created_at(date)
    @merchants.find{|merchant| merchant.created_at == date}
  end

  def find_by_updated_at(date)
    @merchants.find{|merchant| merchant.updated_at == date}
  end

  def find_all_by_name(name)
    @merchants.find_all{|merchant| merchant.name == name}
  end

  def find_all_by_id(id)
    @merchants.find_all{|merchant| merchant.id == id}
  end

  def find_all_by_created_at(date)
    @merchants.find_all{|merchant| merchant.created_at == date}
  end

  def find_all_by_updated_at(date)
    @merchants.find_all{|merchant| merchant.updated_at == date}
  end

  def find_all_successful_invoices_by_merchant_id(merchant_id)
    successful_transactions = @sales_engine.transaction_repository
                                           .find_all_successful_transactions
    find_invoice_by_id(merchant_id).select do |invoice|
      successful_transactions.any? do |transaction|
        transaction.invoice_id == invoice.id &&
        invoice.merchant_id == merchant_id
      end
    end
  end

  def most_revenue(x)
    all.sort_by {|merchant| merchant.revenue }[-x..-1].reverse
  end

  def most_items(x)
    all.sort_by {|merchant| merchant.quantity_items_sold}[-x..-1].reverse
  end

  def revenue(date)
    all.reduce(0) do |total, merchant|
      if merchant.revenue(date) != nil
        total + merchant.revenue(date)
      else
        total
      end
    end
  end


end

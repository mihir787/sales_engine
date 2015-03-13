require_relative 'merchant'
require_relative 'file_loader'

class MerchantRepository
  attr_reader :merchant

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
    "#<#{self.class} #{customers.size} rows>"
  end

  def self.build_merchants(data)
    merchant_objects = data.map do |row|
      Merchant.new(row)
    end
    self.new(merchant_objects)
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


end

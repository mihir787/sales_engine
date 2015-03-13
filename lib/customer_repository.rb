require_relative 'customer'
require_relative 'file_loader'

class CustomerRepository
  attr_reader :customers, :sales_engine

  def initialize(sales_engine)
    @customers = []
    @sales_engine = sales_engine
  end

  def parse_data(path)
    file = FileLoader.parse(path)
    @customers = file.map{|data| Customer.new(data, self)}
    file.close
  end

  def inspect
    "#<#{self.class} #{customers.size} rows>"
  end

  def all
    @customers
  end

  def random
    @customers.sample
  end

  def find_by_id(id)
    @customers.find{|customer| customer.id == id}
  end

  def find_by_first_name(name)
    @customers.find{|customer| customer.first_name == name}
  end

  def find_by_last_name(last_name)
    @customers.find{|customer| customer.last_name == last_name}
  end

  def find_by_created_at(date)
    @customers.find{|customer| customer.created_at == date}
  end

  def find_by_updated_at(date)
    @customers.find{|customer| customer.updated_at == date}
  end

  def find_all_by_first_name(name)
    @customers.find_all{|customer| customer.first_name == name}
  end

  def find_all_by_last_name(name)
    @customers.find_all{|customer| customer.last_name == name}
  end

  def find_all_by_id(id)
    @customers.find_all{|customer| customer.id == id}
  end

  def find_all_by_created_at(date)
    @customers.find_all{|customer| customer.created_at == date}
  end

  def find_all_by_updated_at(date)
    @customers.find_all{|customer| customer.updated_at == date}
  end

end

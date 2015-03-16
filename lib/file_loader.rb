require 'csv'

class FileLoader
  def self.parse(file_name)
    parsed_data = CSV.open(file_name, headers: true, header_converters: :symbol)
  end

end

# puts @customer_data = FileLoader.parse('./fixtures/customers.csv')
# puts @customer_data.to_a
# puts @customer_data.to_a[1]

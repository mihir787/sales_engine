require 'csv'

require 'pry'
binding.pry
class Parser

  def self.parse(file_name)
    parsed_data = CSV.open(file_name, headers: true, header_converters: :symbol).map do |data|
      data
    end
  end

end


# print Parser.parse('./data/customers.csv')[0]




# class DataExtractor
#   attr_reader :file_name, :component
#
#   def initialize(file_name, component)
#     @file_name = file_name
#     @component = component
#   end
#
#   def self.extract
#     CSV.open(file_name, headers: true, header_converters: :symbol).map do |data|
#       component.new(data)
#     end
#   end
#
# end

# #tyler example
# parsed_data = DataExtractor.extract
# merchant_repository = MerchantRepository.new(parsed_data, self)

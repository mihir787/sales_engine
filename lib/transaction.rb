require 'date'
class Transaction

  attr_reader :id, :invoice_id, :credit_card_number, :credit_card_expiration_date, :result, :created_at, :updated_at

  def initialize(data, parent)
    @id                           =   data[:id].to_i
    @invoice_id                   =   data[:invoice_id].to_i
    @credit_card_number           =   data[:credit_card_number]
    @credit_card_expiration_date  =   data[:credit_card_expiration_date].to_i
    @result                       =   data[:result]
    @created_at                   =   Date.parse(data[:created_at])
    @updated_at                   =   Date.parse(data[:updated_at])
    @parent                       =   parent
  end

  def invoice
    @parent.find_invoice(invoice_id)
  end

  def successful_transaction?
    result == "success"
  end
end

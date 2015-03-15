require_relative 'transaction'
require_relative 'file_loader'

class TransactionRepository

  def initialize(sales_engine)
    @transactions = []
    @sales_engine = sales_engine
  end

  def parse_data(path)
    file = FileLoader.parse(path)
    @transactions = file.map{|data| Transaction.new(data, self)}
    file.close
  end

  def inspect
    "#<#{self.class} #{@transactions.size} rows>"
  end

  def all
    @transactions
  end

  def random
    @transactions.sample
  end

  def find_by_id(id)
    @transactions.find{|transaction| transaction.id == id}
  end

  def find_by_invoice_id(id)
    @transactions.find{|transaction| transaction.invoice_id == id}
  end

  def find_by_credit_card_number(number)
    @transactions.find{|transaction| transaction.credit_card_number == number}
  end

  def find_by_credit_card_expiration_date(number)
    @transactions.find{|transaction| transaction.credit_card_expiration_date == number}
  end

  def find_by_result(result)
    @transactions.find{|transaction| transaction.result == result}
  end

  def find_by_created_at(date)
    @transactions.find{|transaction| transaction.created_at == date}
  end

  def find_by_updated_at(date)
    @transactions.find{|transaction| transaction.updated_at == date}
  end

  def find_all_by_id(id)
    @transactions.find_all{|transaction| transaction.id == id}
  end

  def find_all_by_invoice_id(id)
    @transactions.find_all{|transaction| transaction.invoice_id == id}
  end

  def find_all_by_result(result)
    @transactions.find_all{|transaction| transaction.result == result}
  end

  def find_all_by_credit_card_number(number)
    @transactions.find_all{|transaction| transaction.credit_card_number == number}
  end

  def find_all_by_credit_card_expiration_date(number)
    @transactions.find_all{|transaction| transaction.credit_card_expiration_date == number}
  end

  def find_all_by_created_at(date)
    @transactions.find_all{|transaction| transaction.created_at == date}
  end

  def find_all_by_updated_at(date)
    @transactions.find_all{|transaction| transaction.updated_at == date}
  end

  def find_invoice(id)
    @sales_engine.transaction_find_invoice_by_invoice_id(id)
  end


end

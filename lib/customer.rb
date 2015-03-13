class Customer
  attr_reader :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(data, repo)
    @id           =   data[:id]
    @first_name   =   data[:first_name]
    @last_name    =   data[:last_name]
    @created_at   =   data[:created_at]
    @updated_at   =   data[:updated_at]
    @repo         =   repo
  end

  def invoices
    @parent.find_invoices(id)
  end
end

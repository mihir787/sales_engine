class Merchant
  attr_reader :id, :name, :created_at, :updated_at

  def initialize(data, repo)
    @id         =   data[:id]
    @name       =   data[:name]
    @created_at =   data[:created_at]
    @updated_at =   data[:updated_at]
    @repo = repo
  end

  def item
    @repo.find_item_by_id(@id)
  end

  def invoice
    @repo.find_invoice_by_id(@id)
  end

end

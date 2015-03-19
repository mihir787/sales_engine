class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(data, parent)
    @id           =   data[:id].to_i
    @customer_id  =   data[:customer_id].to_i
    @merchant_id  =   data[:merchant_id].to_i
    @status       =   data[:status]
    @created_at   =   Date.parse(data[:created_at])
    @updated_at   =   Date.parse(data[:updated_at])
    @parent       =   parent
  end

  def customer
    @parent.find_by_customer(@customer_id)
  end

  def transactions
    @parent.find_transactions_by_id(@id)
  end

  def invoice_items
    @parent.find_invoice_items_by_id(@id)
  end

  def merchant
    @parent.find_merchant_by_id(@id)
  end

  def items
    invoice_items.map do |invoice_item|
      invoice_item.item
    end
  end

  def successful?
    transactions.select{ |transaction| transaction.successful_transaction? }
  end

  def add_items(items)
    items_collection = []
    items.group_by { |item| item }.each do |item, item_collection|
      items_collection << [item, item_collection.count]
    end
    items_collection
  end

  def charge(input)
    @parent.pass_to_invoice_repo(input, id)

  end

    #NOTE  there woulcd be repeats


    #call group_b on items to gourp them by item id
    #iterate through that result, and for each pair...
      # create an invoice item
      # set the item_id to the key
      # set the quantity to the number of items in the value
      # set the invoice_id to my id
      # add the invoice_item to invoice_item repo

end

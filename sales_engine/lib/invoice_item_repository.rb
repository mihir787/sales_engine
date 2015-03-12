require_relative 'invoice_item'

class InvoiceItemRepository

  def initialize(invoice_items)
    @invoice_items = invoice_items
  end

  def all
    @invoice_items
  end

  def inspect
    "#<#{self.class} #{customers.size} rows>"
  end

  def random
    @invoice_items.sample
  end

  def find_by_id(id)
    @invoice_items.find{|invoice_item| invoice_item.id == id}
  end

  def find_by_item_id(id)
    @invoice_items.find{|invoice_item| invoice_item.item_id == id}
  end

  def find_by_invoice_id(id)
    @invoice_items.find{|invoice_item| invoice_item.invoice_id == id}
  end

  def find_by_quantity(amount)
    @invoice_items.find{|invoice_item| invoice_item.quantity == amount}
  end

  def find_by_unit_price(price)
    @invoice_items.find{|invoice_item| invoice_item.unit_price == price}
  end

  def find_by_created_at(date)
    @invoice_items.find{|invoice_item| invoice_item.created_at == date}
  end

  def find_by_updated_at(date)
    @invoice_items.find{|invoice_item| invoice_item.updated_at == date}
  end

  def find_all_by_id(id)
    @invoice_items.find_all{|invoice_item| invoice_item.id == id}
  end

  def find_all_by_item_id(id)
    @invoice_items.find_all{|invoice_item| invoice_item.item_id == id}
  end

  def find_all_by_invoice_id(id)
    @invoice_items.find_all{|invoice_item| invoice_item.invoice_id == id}
  end

  def find_all_by_quantity(amount)
    @invoice_items.find_all{|invoice_item| invoice_item.quantity == amount}
  end

  def find_all_by_unit_price(price)
    @invoice_items.find_all{|invoice_item| invoice_item.unit_price == price}
  end

  def find_all_by_created_at(date)
    @invoice_items.find_all{|invoice_item| invoice_item.created_at == date}
  end

  def find_all_by_updated_at(date)
    @invoice_items.find_all{|invoice_item| invoice_item.updated_at == date}
  end



end

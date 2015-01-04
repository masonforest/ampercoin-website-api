class PreorderedAccount < ActiveRecord::Base
  has_many :orders

  def self.last_3
    paid.
      order(:created_at).
      last(3)
  end

  def self.paid
    joins(:orders).
      where('orders.payment_transaction IS NOT NULL')
  end

  def self.remaining
    10000 - paid.count
  end
end

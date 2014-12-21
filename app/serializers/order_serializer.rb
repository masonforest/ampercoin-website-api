class OrderSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :payment_address

  has_one :account
end

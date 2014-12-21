class AccountSerializer < ActiveModel::Serializer
  attributes :id, :address, :public_key
end

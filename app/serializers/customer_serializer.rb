class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at

  has_one :customer_profile
end

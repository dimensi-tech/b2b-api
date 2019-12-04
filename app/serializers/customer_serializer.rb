class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at
end

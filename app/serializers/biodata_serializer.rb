class BiodataSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :phone, :heir_name, :heir_contact,
             :family_relation
end

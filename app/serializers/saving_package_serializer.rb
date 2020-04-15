class SavingPackageSerializer < ActiveModel::Serializer
  attributes :id, :package_id, :sort, :amount
end

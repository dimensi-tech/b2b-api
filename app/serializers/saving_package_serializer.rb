class SavingPackageSerializer < ActiveModel::Serializer
  attributes :id, :package_id, :sort, :amount, :adult_amount, :child_amount
end

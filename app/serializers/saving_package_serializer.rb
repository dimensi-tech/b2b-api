class SavingPackageSerializer < ActiveModel::Serializer
  attributes :id, :package_id, :sort, :adult_amount, :child_amount
end

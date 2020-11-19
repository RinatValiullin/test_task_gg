class ClientSerializer
  include JSONAPI::Serializer

  attributes :email
  attribute :amount_of_companies do |object|
    object.companies.count
  end
end

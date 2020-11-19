class CompanySerializer
  include JSONAPI::Serializer
  attributes :subject
  attribute :created_at do |object|
    object.created_at.strftime("%b %d %Y")
  end
end

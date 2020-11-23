class ClientCreator < ApplicationService
  attr_accessor :email

  validates :email, email: true

  def initialize(email)
    self.email = email
  end

  def call
    client = Client.find_or_initialize_by(email: email)
    if client.valid?
      client.save
      self.response = client
    else
      add_errors(client.errors)
    end
  end
end

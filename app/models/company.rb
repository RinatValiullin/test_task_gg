class Company < ActiveRecord::Base
  has_many :client_company
  has_many :clients, through: :client_company
end

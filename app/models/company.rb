class Company < ActiveRecord::Base
  has_many :clients_companies
  has_many :clients, through: :clients_companies
end

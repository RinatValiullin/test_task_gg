class Client < ActiveRecord::Base
  has_many :clients_companies
  has_many :companies, through: :clients_companies
end

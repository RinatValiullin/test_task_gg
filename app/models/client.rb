class Client < ActiveRecord::Base
  has_many :client_company
  has_many :companies, through: :client_company
end

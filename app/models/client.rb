class Client < ActiveRecord::Base
  has_many :client_company, dependent: :destroy
  has_many :companies, through: :client_company

  validates_uniqueness_of :email
  validates :email, email: true
end

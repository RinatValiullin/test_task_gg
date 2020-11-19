class Company < ActiveRecord::Base
  has_many :client_company, dependent: :destroy
  has_many :clients, through: :client_company

  validates_uniqueness_of :subject
end

require "rails_helper"

describe Company do
  subject { Company.new }

  describe 'association' do
    it { is_expected.to have_many(:clients).through(:client_company)}
    it { is_expected.to have_many(:client_company).dependent(:destroy)}
  end

  describe 'validations' do
    it { is_expected.to validate_uniqueness_of :subject }
    it { is_expected.to validate_uniqueness_of :message }
  end
end

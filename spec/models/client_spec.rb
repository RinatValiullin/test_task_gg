require "rails_helper"

describe Client do
  subject { described_class.new }

  describe 'association' do
    it { is_expected.to have_many(:companies).through(:client_company)}
    it { is_expected.to have_many(:client_company).dependent(:destroy)}
  end

  describe '#email' do
    it { is_expected.to validate_uniqueness_of :email }

    it 'validates presence' do
      record = Client.new
      record.valid?
      expect(record.errors[:email]).to include("is invalid")

      record.email = 'foo@bar.com'
      record.valid?
      expect(record.errors[:email]).to_not include("is invalid")
    end
  end
end

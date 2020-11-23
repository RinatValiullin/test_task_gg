require "rails_helper"

describe ClientCreator do

  describe "#call" do

    describe "with valid email" do
      let(:email) { "test@test.com" }

      it do
        expect(Client.count).to eql(0)
        described_class.call(email)

        expect(Client.count).to eql(1)
      end
    end

    describe "without email" do
      it do
        expect(Client.count).to eql(0)
        result = described_class.call(nil)

        expect(Client.count).to eql(0)
        expect(result.errors).to eql("Email is invalid")
      end
    end

    describe "with incorrect email" do
      let(:email) { "test.com" }

      it do
        expect(Client.count).to eql(0)
        result = described_class.call(email)

        expect(Client.count).to eql(0)
        expect(result.errors).to eql("Email is invalid")
      end
    end
  end
end

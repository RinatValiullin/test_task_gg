require "rails_helper"

describe CompanyCreator do

  describe "#call" do
    let(:params) do
      {
        emails: emails,
        subject: subject,
        message: message
      }
    end

    describe "with valid args" do
      let(:emails) { "test@test.com, test2@test.com" }
      let(:subject) { "subject" }
      let(:message) { "message" }

      it do
        expect(Company.count).to eql(0)
        expect(Client.count).to eql(0)
        result = described_class.call(params)

        expect(Company.count).to eql(1)
        expect(Client.count).to eql(2)

        created_company = Company.last
        expect(created_company.clients.count).to eql(2)

        Client.all.each do |client|
          expect(client.companies.count).to eq(1)
          expect(client.companies.last).to eq(created_company)
        end
      end
    end

    describe "without emails" do
      let(:emails) { nil }
      let(:subject) { "subject" }
      let(:message) { "message" }

      it do
        expect(Company.count).to eql(0)
        expect(Client.count).to eql(0)
        result = described_class.call(params)

        expect(Company.count).to eql(0)
        expect(Client.count).to eql(0)

        expect(result.errors).to eql("Emails can't be blank")
      end
    end

    describe "without subject" do
      let(:emails) { "test@test.com, test2@test.com" }
      let(:subject) { nil }
      let(:message) { "message" }

      it do
        expect(Company.count).to eql(0)
        expect(Client.count).to eql(0)
        result = described_class.call(params)

        expect(Company.count).to eql(0)
        expect(Client.count).to eql(0)

        expect(result.errors).to eql("Subject can't be blank")
      end
    end

    describe "without message" do
      let(:emails) { "test@test.com, test2@test.com" }
      let(:subject) { "subject" }
      let(:message) { nil }

      it do
        expect(Company.count).to eql(0)
        expect(Client.count).to eql(0)
        result = described_class.call(params)

        expect(Company.count).to eql(0)
        expect(Client.count).to eql(0)

        expect(result.errors).to eql("Message can't be blank")
      end
    end

    describe "with incorrect email" do
      let(:emails) { "test qwqwe" }
      let(:subject) { "subject" }
      let(:message) { "message" }

      it do
        expect(Company.count).to eql(0)
        expect(Client.count).to eql(0)
        result = described_class.call(params)

        expect(Company.count).to eql(0)
        expect(Client.count).to eql(0)

        expect(result.errors).to eql("Client Email is invalid")
      end
    end
  end
end

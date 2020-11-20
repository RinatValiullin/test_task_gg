require 'rails_helper'

describe Api::CompanyController do
  let!(:clients) { create_list(:client, 3) }
  describe "POST create" do
    it 'creates company' do
      params = {
        subject: "subject",
        message: "message",
        emails: clients.map(&:email).join(", ")
      }

      post :create, params: params

      expect(JSON.parse(response.body)["data"]).to eql({ "message" => "Emails sent" })

      client = clients.first
      client.reload
      created_company = client.companies.first

      expect(client.companies.count).to eql(1)
      expect(created_company.subject).to eql("subject")
      expect(created_company.message).to eql("message")
      expect(created_company.clients.count).to eql(clients.count)
    end

    it 'render error if user try to create company without subject' do
      params = {
        message: "message",
        emails: clients.map(&:email).join(", ")
      }

      post :create, params: params

      expect(JSON.parse(response.body)["data"]["message"]).to eql("Something goes wrong")
      expect(response.status).to eql(422)
    end

    it 'render error if user try to create company without message' do
      params = {
        subject: "subject",
        emails: clients.map(&:email).join(", ")
      }

      post :create, params: params

      expect(JSON.parse(response.body)["data"]["message"]).to eql("Something goes wrong")
      expect(response.status).to eql(422)
    end

    it 'render error if user try to create company without message' do
      params = {
        subject: "subject",
        message: "message",
      }

      post :create, params: params

      expect(JSON.parse(response.body)["data"]["message"]).to eql("You forgot to enter emails")
      expect(response.status).to eql(422)
    end
  end
end

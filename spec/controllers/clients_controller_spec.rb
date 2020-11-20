require 'rails_helper'

describe Api::ClientsController do
  let(:companies) { create_list(:company, 3) }
  let!(:clients) { create_list(:client, 3, companies: companies) }

  describe "GET index" do
    it do
      get :index

      result = response.body
      expected_values = ClientSerializer.new(clients).serializable_hash.to_json

      expect(result).to eq(expected_values)
    end
  end

  describe "GET companies_list" do
    it 'get values sorted by created_at' do
      get :companies_list, params: { order: "created_at desc", id: clients.first}

      result = response.body
      expected_values = CompanySerializer.new(clients.first.companies.order(created_at: :desc)).serializable_hash.to_json

      expect(result).to eq(expected_values)
    end

    it 'get values sorted by sunject' do
      get :companies_list, params: { order: "subject desc", id: clients.second}

      result = response.body
      expected_values = CompanySerializer.new(clients.second.companies.order(created_at: :desc)).serializable_hash.to_json

      expect(result).to eq(expected_values)
    end
  end
end

class Api::ClientsController < ApplicationController
  def index
    clients = Client.all

    render json: ClientSerializer.new(clients).serializable_hash
  end

  def companies_list
    render json: CompanySerializer.new(ordered_companies_list).serializable_hash
  end

  private

  def client
    Client.find(params[:id])
  end

  def ordered_companies_list
    client.companies.order(params[:order])
  end
end

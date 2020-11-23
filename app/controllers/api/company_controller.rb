class Api::CompanyController < ApplicationController
  def create
    result = ClientsCompanyCreator.call(company_params)

    if result.success?
      head :created
    else
      render json: { errors: result.errors }, status: 422
    end
  end
end

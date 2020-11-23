class Api::CompanyController < ApplicationController
  def create
    result = CompanyCreator.call(company_params)

    if result.success?
      head :created
    else
      render json: { errors: result.errors }, status: 422
    end
  end

  private

  def company_params
    params.permit(:emails, :subject, :message)
  end
end

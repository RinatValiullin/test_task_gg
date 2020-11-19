class Api::CompanyController < ApplicationController
  def create
    clients_emails = ClientsEmailsService.separate_emails(company_params[:emails])

    ClientsCompanyCreator.call(clients_emails, company_params[:subject], company_params[:message])
  end

  private

  def company_params
    params.permit(:subject, :emails, :message)
  end
end

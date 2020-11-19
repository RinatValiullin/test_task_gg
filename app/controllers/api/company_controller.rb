class Api::CompanyController < ApplicationController
  def create
    clients_emails = ClientsEmailsService.separate_emails(recepients)

    ClientsCompanyCreator.call(clients_emails, subject, message)
    EmailWorker.perform_async(clients_emails, subject, message)
  end

  private

  def company_params
    params.permit(:subject, :emails, :message)
  end

  def subject
    @subject ||= company_params[:subject]
  end

  def recepients
    company_params[:emails]
  end

  def message
    @message ||= company_params[:message]
  end
end

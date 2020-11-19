class Api::CompanyController < ApplicationController
  def create
    begin
      clients_emails = ClientsEmailsService.separate_emails(recepients)

      ClientsCompanyCreator.call(clients_emails, subject, message)
      EmailJob.perform_later(clients_emails, subject, message)

      render json: { data: { message: "Emails sended" } }
    rescue Exception => e
      render json: { data: { message: e.message } }
    end
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

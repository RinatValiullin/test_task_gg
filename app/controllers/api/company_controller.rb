class Api::CompanyController < ApplicationController
  include EmailsSeparatorHelper

  def create
    begin
      if recepients.blank?
        render json: { data: { message: "You forgot to enter emails" } }, status: 422
        return
      end

      clients_emails = separate_emails(recepients)

      ClientsCompanyCreator.call(clients_emails, subject, message)
      EmailJob.perform_later(clients_emails, subject, message)

      render json: { data: { message: "Emails sent" } }
    rescue Exception => e
      Rails.logger.error(e.message)
      render json: { data: { message: "Something goes wrong" } }, status: 422
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

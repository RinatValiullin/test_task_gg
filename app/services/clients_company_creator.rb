class ClientsCompanyCreator < ApplicationService
  include EmailsSeparatorHelper

  attr_accessor :emails, :subject, :message

  validates :subject, :message, :emails, presence: true

  def initialize(args)
    self.emails = args[:emails]
    self.subject = args[:subject]
    self.message = args[:message]
  end

  def call
    company = Company.new(subject: @subject, message: @message)
    company.clients = find_or_create_clients

    if company.valid?
      company.save
      EmailJob.perform_later(normalized_email, subject, message)
    else
      add_errors(company.errors)
    end
  end

  private

  def find_or_create_clients
    clients = []

    normalized_email.each do |email|
      client_creator = ClientCreator.call(email)

      if client_creator.success?
        clients << client_creator.response
      else
        errors.add(:client, client_creator.errors)
      end
    end

    clients
  end

  def normalized_email
    @normalized_email ||= separate_emails(emails)
  end
end

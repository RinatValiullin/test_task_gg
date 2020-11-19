class ClientsCompanyCreator

  attr_accessor :emails, :subject, :message

  def initialize(emails, subject, message)
    @emails = emails
    @subject = subject
    @message = message
  end

  def self.call(emails, subject, message)
    self.new(emails, subject, message).create
  end

  def create
    company = Company.create(subject: @subject, message: @message)
    @emails.each do |email|
      client = Client.find_or_initialize_by(email: email)
      client.companies << company
      client.save
    end
  end
end

class MailgunMailer
  def self.send_message(emails, subject, message)
    begin
      api_key = Rails.application.credentials.mailers[:MAILGUN_API_KEY]
      domain = Rails.application.credentials.mailers[:MAILGUN_DOMAIN]

      mg_client = Mailgun::Client.new(api_key)

      # Define your message parameters
      message_params =  {
        from: "user@#{domain}.com",
        to:   emails.join(", "),
        subject: subject,
        text:    message
      }

      # Send your message through the client
      mg_client.send_message(domain, message_params)
    rescue Exception => e
      Rails.logger.error(e.message)
      return false
    end
  end
end

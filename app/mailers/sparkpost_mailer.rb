class SparkpostMailer
  def self.send_message(emails, subject, message)
    begin
      api_key = Rails.application.credentials.mailers[:SPARKPOST_API_KEY]
      email = Rails.application.credentials.mailers[:SPARKPOST_EXAMPLE_EMAIL]

      client = SimpleSpark::Client.new(api_key: api_key)

      addresses = emails.map { |address| { address: address }}
      properties = {
        options: { sandbox: true },
        recipients: addresses,
        content: {
          from: { email: email },
          subject: subject,
          text: message
        }
      }

      client.transmissions.create(properties)
    rescue Exception => e
      Rails.logger.error(e.message)
      return false
    end
  end
end

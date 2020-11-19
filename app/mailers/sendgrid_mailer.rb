class SendgridMailer
  def self.deliver(emails, subject, message)
    begin
      api_key = Rails.application.secrets[:SPARKPOST_API_KEY]
      email = Rails.application.secrets[:SPARKPOST_EXAMPLE_EMAIL]

      client = SimpleSpark::Client.new(api_key: "api_key")

      addresses = emails.map { |address| { address: address }}
      properties = {
        options: { sandbox: true },
        recipients: addresses,
        content: {
          from: { email: "qweqw@asdasd.com" },
          subject: subject,
          text: message
        }
      }

      client.transmissions.create(properties)
    rescue Exception => e
      return false
    end
  end
end

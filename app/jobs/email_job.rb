class EmailJob < ApplicationJob
  MAILERS = [
    SparkpostMailer,
    MailgunMailer
  ]

  queue_as :default

  def perform(*args)
    emails, subject, message = args
    begin
      MAILERS.each do |mailer|
        response = mailer.send_message(emails, subject, message)

        break if response
      end
    rescue Exception => e
      Rails.logger.error(e.message)
    end
  end
end

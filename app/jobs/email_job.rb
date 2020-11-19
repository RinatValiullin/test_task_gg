class EmailWorker < ApplicationJob
  MAILERS = [
    SparkpostMailer,
    MailgunMailer
  ]

  queue_as :default

  def perform(*args)
    emails, subject, message = args
    MAILERS.each do |mailer|
      mailer.send_message(emails, subject, message)

      break if response
    end
  end
end

module EmailsSeparatorHelper
  def separate_emails(emails)
    emails.gsub(",", "\n").split("\n").map(&:strip)
  end
end

class ApplicationService
  include ActiveModel::Validations

  attr_accessor :args, :response

  def initialize(args={})
    self.args = args
  end

  def self.call(args)
    instance = new(args)

    instance.call_with_validation

    instance.returns
  end

  def call_with_validation
    return unless valid?

    call
  end

  def returns
    OpenStruct.new(
      errors: errors.full_messages.join("\n"),
      response: response,
      success?: success?
    )
  end

  private

  def add_errors(errors)
    errors.merge!(errors)
  end

  def success?
    errors.blank?
  end
end

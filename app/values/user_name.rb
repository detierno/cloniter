# frozen_string_literal: true

class UserName < WholeValue
  attr_reader :errors

  def initialize(content)
    super()

    @errors = []
    @content = content

    validate
    freeze
  end

  def exceptional?
    errors.any?
  end

  def to_s
    @content.to_s
  end

  def inspect
    "#{self.class}(#{@content})"
  end

  def reason
    errors.join(', ')
  end

  private

  attr_reader :content

  def validate
    errors << 'Cannot be blank' if content.blank?
    errors << 'Invalid format' unless content.match?(/\A[a-z0-9_]+\z/)
  end
end

# rubocop:disable  Naming/MethodName
def UserName(content)
  case content
  when String then UserName.new(content)
  when UserName then content
  else
    ExceptionalValue.new(content, reason: "Can't make Name from #{content.inspect}")
  end
end
# rubocop:enable  Naming/MethodName

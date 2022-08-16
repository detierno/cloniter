# frozen_string_literal: true

class Name < WholeValue
  def initialize(content)
    @content = content
    freeze

    super
  end

  def to_s
    @content.to_s
  end

  def inspect
    "#{self.class}(#{@content})"
  end
end

class NameValidator
  MINIMUN_SIZE = 3

  def initialize(content)
    @content = content
    @errors = []
  end

  def value
    valid? ? Name.new(content) : ExceptionalValue.new(content, reason: errors.join(', '))
  end

  private

  attr_reader :content, :errors

  def valid?
    errors << 'Cannot be blank' if content.blank?
    errors << "Cannot be less than #{MINIMUN_SIZE}" if content.length < MINIMUN_SIZE

    errors.empty?
  end
end

def Name(content)
  case content
  when Name then content
  when String then NameValidator.new(content).value
  else
    ExceptionalValue.new(content, reason: "Can't make Name from #{content.inspect}")
  end
end

# frozen_string_literal: true

# WholeValue approach is to move away from
# primitive obsession, making important data first class citizens on the app.
#
#   Pros
#   - Values are not strings so no string methods allowed unless explicit implemented
#   - More meaninful
#
#   Cons
#   - Overhead with validations
class Name < WholeValue
  MINIMUN_SIZE = 3

  attr_reader :errors

  def initialize(content)
    super()

    @errors = []
    @content = content

    validate
    freeze
  end

  def to_s
    @content.to_s
  end

  def exceptional?
    errors.any?
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
    errors << "Cannot be less than #{MINIMUN_SIZE}" if content.length < MINIMUN_SIZE
  end
end

# rubocop:disable Naming/MethodName
def Name(content)
  case content
  when Name then content
  when String then Name.new(content)
  else
    ExceptionalValue.new(content, reason: "Can't make Name from #{content.inspect}")
  end
end
# rubocop:enable Naming/MethodName

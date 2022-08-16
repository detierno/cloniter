# frozen_string_literal: true

class UserName < WholeValue
  def initialize(content)
    super()

    @content = content
    freeze
  end

  def to_s
    @content.to_s
  end

  def inspect
    "#{self.class}(#{@content})"
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

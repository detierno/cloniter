# frozen_string_literal: true

class TweetContent < WholeValue
  MAX_LENGTH = 140

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
    errors << "Cannot be more than #{MAX_LENGTH}" if content.length > MAX_LENGTH
  end
end

# rubocop:disable Naming/MethodName
def TweetContent(content)
  case content
  when TweetContent then content
  when String then TweetContent.new(content)
  else
    ExceptionalValue.new(content, reason: "Can't make TweetContent from #{content.inspect}")
  end
end
# rubocop:enable Naming/MethodName

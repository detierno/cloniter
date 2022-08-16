class UserName < WholeValue
  def initialize(content)
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

def UserName(content)
  case content
  when String then UserName.new(content)
  when UserName then content
  else
    ExceptionalValue.new(content, reason: "Can't make Name from #{content.inspect}")
  end
end

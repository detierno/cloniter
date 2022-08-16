class ExceptionalValue
  attr_reader :reason

  def initialize(raw_value, reason: 'Unspecified')
    @raw = raw_value
    @reason = reason
  end

  def exceptional?
    true
  end

  def to_s
    @raw.to_s
  end
end

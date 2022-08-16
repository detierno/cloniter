class ValueValidator < ActiveModel::EachValidator
  def validate_each(obj, attribute, value)
    if value.exceptional?
      message = options[:message] || "is invalid: #{value.reason}"
      obj.errors.add(attribute, message)
    end
  end
end

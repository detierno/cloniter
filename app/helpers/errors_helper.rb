# frozen_string_literal: true

module ErrorsHelper
  def exceptional_messages(field)
    tag.p(field.reason, class: 'mb-5 text-orange-400') if field.exceptional?
  end

  def error_messages(record, field)
    if (errors = record.errors[field])
      tag.p(errors.join(', '), class: 'mb-5 text-orange-400')
    end
  end
end

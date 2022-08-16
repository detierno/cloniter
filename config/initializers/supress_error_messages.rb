# frozen_string_literal: true

# rubocop:disable  Rails/OutputSafety
ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  html_tag.html_safe
end
# rubocop:enable  Rails/OutputSafety

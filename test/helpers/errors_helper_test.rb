# frozen_string_literal: true

require 'test_helper'

class ErrorsHelperTest < ActionView::TestCase
  test 'exceptional_messages returns nothing for non exceptional fields' do
    field = mock('Field', exceptional?: false)
    assert_nil exceptional_messages(field)
  end

  test 'exceptional_messages returns reason for  exceptional fields' do
    field = mock('Field', exceptional?: true, reason: 'a good reason')
    assert_dom_equal %{<p class="mb-5 text-orange-400">a good reason</p>}, exceptional_messages(field)
  end

  test 'error_messages returns nothing for empty errors' do
    record = mock('Record', errors: {})
    assert_nil error_messages(record, :name)
  end

  test 'error_messages returns full error messages' do
    record = mock('Record', errors: { name: %w[error1 error2] })
    assert_dom_equal %{<p class="mb-5 text-orange-400">error1, error2</p>}, error_messages(record, :name)
  end
end

# frozen_string_literal: true

require 'test_helper'

class AlertComponentTest < ViewComponent::TestCase
  test 'info renders primary class with message' do
    expected = <<~STR.squish
      <div
        class="p-4 mb-4 text-sm text-primary-700 bg-primary-100 rounded-lg dark:bg-primary-200 dark:text-primary-800"
        role="alert">Hey There</div>
    STR

    assert_equal(
      expected,
      render_inline(AlertComponent::Info.new(message: 'Hey There')).to_html.squish
    )
  end

  test 'alert renders alert class with message' do
    expected = <<~STR.squish
      <div
        class="p-4 mb-4 text-sm text-alert-700 bg-alert-100 rounded-lg dark:bg-alert-200 dark:text-alert-800"
        role="alert">Hey There</div>
    STR

    assert_equal(
      expected,
      render_inline(AlertComponent::Alert.new(message: 'Hey There')).to_html.squish
    )
  end
end

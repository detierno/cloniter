# frozen_string_literal: true

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'current account for logged user' do
    mock_account = mock('Account')
    Current.account = mock_account

    assert_equal mock_account, current_account
  end

  test 'current account for non logged user' do
    assert_kind_of AnonymousAccount, current_account
  end
end

# frozen_string_literal: true

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  test 'valid fixtures' do
    assert accounts(:valid).valid?
    assert_not accounts(:invalid).valid?
  end

  test 'validates password presence' do
    account = Account.new
    assert_include_error account, :password, :blank
  end

  test 'is always authenticated' do
    account = Account.new
    assert account.authenticated?
  end
end

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

  test '.all_except it scope out account' do
    account = accounts(:valid)
    assert_match /where "accounts"\."id" \!\= #{account.id}/i, Account.all_except(account).to_sql
  end
end

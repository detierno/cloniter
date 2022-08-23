# frozen_string_literal: true

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  setup do
    @jon = create(:jon_account)
  end

  def stub_subscribed_accounts(account)
    mock('SubAccounts').tap do |subscribed_accounts_mock|
      account.stubs(:subscribed_accounts).returns(subscribed_accounts_mock)
    end
  end

  test 'valid fixtures' do
    assert build(:account).valid?
    assert_not build(:account, :invalid).valid?
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
    assert_match(/where "accounts"\."id" != #{@jon.id}/i, Account.all_except(@jon).to_sql)
  end

  test '#follow' do
    samsa = create(:samsa_account)

    sub_mock = stub_subscribed_accounts(@jon)
    sub_mock.expects(:subscribe).with(samsa).once

    @jon.follow(samsa)
  end

  test '#follows?' do
    samsa = create(:samsa_account)

    sub_mock = stub_subscribed_accounts(@jon)
    sub_mock.expects(:subscribed?).with(samsa).once

    @jon.follows?(samsa)
  end

  test '#subscribers with existing accounts' do
    samsa = create(:samsa_account)
    samsa.subscribed_accounts.create!(account: @jon)

    assert_equal [samsa], @jon.subscribers
  end

  test '#subscribers without existing accounts' do
    assert_empty @jon.subscribers
  end

  test '#unfollow' do
    samsa = create(:samsa_account)

    sub_mock = stub_subscribed_accounts(@jon)
    sub_mock.expects(:unsubscribe).with(samsa).once

    @jon.unfollow(samsa)
  end
end

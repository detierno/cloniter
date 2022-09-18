# frozen_string_literal: true

require 'application_system_test_case'

class FollowAccountTest < ApplicationSystemTestCase
  def setup
    @account = create(:account, password: 'secret')
    system_login @account, 'secret'

    @nice_account = create(:account)
  end

  test 'Following an account' do
    click_on 'Users'
    click_on 'Follow'

    assert_text 'Account followed'
  end

  test 'Unfollowing an account' do
    @account.follow(@nice_account)

    click_on 'Users'
    click_on 'Unfollow'

    assert_text 'Account unfollowed'
  end
end

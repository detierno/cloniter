# frozen_string_literal: true

require 'test_helper'

class FollowersControllerTest < ActionDispatch::IntegrationTest
  def setup
    @account = create(:account, password: 'secret')
    sign_in_account @account, 'secret'

    @account_to_follow = create :account
  end

  test 'should increase followers count' do
    assert_changes('@account_to_follow.followers.count', 1) do
      post followers_url(id: @account_to_follow)
    end

    assert_response :found
  end

  test 'should decrease followers count unfollowing' do
    @account.follow(@account_to_follow)

    assert_changes('@account_to_follow.followers.count', -1) do
      delete follower_url(@account_to_follow)
    end

    assert_response :see_other
  end
end

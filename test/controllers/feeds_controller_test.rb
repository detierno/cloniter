# frozen_string_literal: true

require 'test_helper'

class FeedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = create(:account, password: 'secret')
    sign_in_account @account, 'secret'
  end

  test 'should get accounts index' do
    get feed_url
    assert_response :success
  end

  test 'should call Current.account.feed' do
    Account.any_instance.expects(:feed).once

    get feed_url
    assert_response :success
  end
end

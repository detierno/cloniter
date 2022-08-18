# frozen_string_literal: true

require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test 'should get tweets index' do
    sign_in_account accounts(:valid), self

    get tweets_url
    assert_response :success
  end
end

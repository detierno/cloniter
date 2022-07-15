# frozen_string_literal: true

require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    sign_in_user users(:valid), self

    get tweets_url
    assert_response :success
  end
end

# frozen_string_literal: true

require 'test_helper'

module Auth
  class SessionsControllerTest < ActionDispatch::IntegrationTest
    test 'should get new' do
      get sign_in_path
      assert_response :success
    end

    def setup
      @user = users(:valid)
      @user.update!(password: 'secret')
    end

    test 'should post create with correct params' do
      post sign_in_path, params: { username: @user.username, password: 'secret' }
      assert_redirected_to root_path
    end

    test 'set user_id cookie' do
      post sign_in_path, params: { username: @user.username, password: 'secret' }
      assert_not_nil @response.cookies['user_id']
    end

    test 'render new with incorrect params' do
      post sign_in_path, params: { username: '' }
      assert_response :success
    end

    test 'does not set user_id cookie' do
      post sign_in_path, params: { username: '' }
      assert_nil @response.cookies['user_id']
    end
  end
end

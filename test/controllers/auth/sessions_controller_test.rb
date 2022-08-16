# frozen_string_literal: true

require 'test_helper'

module Auth
  class SessionsControllerTest < ActionDispatch::IntegrationTest
    test 'should get new' do
      get sign_in_path
      assert_response :success
    end

    def setup
      @account = accounts(:valid)
      @account.update!(password: 'secret')
    end

    test 'should post create with correct params' do
      post sign_in_path, params: { username: @account.username, password: 'secret' }
      assert_redirected_to root_path
    end

    test 'set account_id cookie' do
      post sign_in_path, params: { username: @account.username, password: 'secret' }
      assert_not_nil @response.cookies['account_id']
    end

    test 'render new with incorrect params' do
      post sign_in_path, params: { username: '' }
      assert_response :unprocessable_entity
    end

    test 'does not set account_id cookie' do
      post sign_in_path, params: { username: '' }
      assert_nil @response.cookies['account_id']
    end
  end
end

# frozen_string_literal: true

require 'test_helper'

module Auth
  class RegistrationsControllerTest < ActionDispatch::IntegrationTest
    test 'should get new' do
      get sign_up_url
      assert_response :success
    end

    test 'should create an account with correct params' do
      assert_difference('Account.count') do
        post sign_up_path, params: { account: {
          name: 'John Snow',
          username: 'kingofnorth',
          password: 'dogdoggo',
          password_confirmation: 'dogdoggo'
        } }
      end

      assert_redirected_to root_path
    end

    test 'should render new with wrong params' do
      assert_no_difference('Account.count') do
        post sign_up_path, params: { account: {
          name: 'John Snow',
          username: 'kingofnorth',
          password: ''
        } }
      end

      assert_response :unprocessable_entity
    end
  end
end

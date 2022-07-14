# frozen_string_literal: true
require 'test_helper'

module Auth
  class RegistrationsControllerTest < ActionDispatch::IntegrationTest
    test 'should get new' do
      get sign_up_url
      assert_response :success
    end

    test 'should create an user witho correct params' do
      assert_difference('User.count') do
        post sign_up_path, params: { user: {
          name: 'John Snow',
          username: 'kingofnorth',
          password: 'dogdoggo',
          password_confirmation: 'dogdoggo'
        }}
      end

      assert_redirected_to root_path
    end

    test 'should render new with wrong params' do
      assert_no_difference('User.count') do
        post sign_up_path, params: { user: {
          name: 'John Snow',
          username: 'kingofnorth',
          password: ''
        }}
      end

      assert_response :success
    end
  end
end

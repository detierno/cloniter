# frozen_string_literal: true

require 'test_helper'

class AuthenticationTest < ActiveSupport::TestCase
  Cookies = Struct.new(:encrypted)

  def setup
    controller_klass = Class.new(ApplicationController) do
      include Authentication

      def cookies
        @cookies ||= Cookies.new({})
      end

      def sign_in_path; end

      def redirect_to(*); end
    end

    @controller = controller_klass.new
  end

  test 'dont set Current.user when cookie is invalid' do
    @controller.send :authenticate
    assert_nil Current.user
  end

  test 'redirect user to sign in if cookie is invalid' do
    @controller.expects(:sign_in_path).once
    @controller.send :authenticate
  end

  test 'set Current.user when cookie is valid' do
    user = users(:valid)

    @controller.cookies[:encrypted] = { user_id: user.id }
    @controller.send :authenticate

    assert_equal user, Current.user
  end
end

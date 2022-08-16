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

  test 'dont set Current.account when cookie is invalid' do
    @controller.send :authenticate
    assert_nil Current.account
  end

  test 'redirect account to sign in if cookie is invalid' do
    @controller.expects(:sign_in_path).once
    @controller.send :authenticate
  end

  test 'set Current.account when cookie is valid' do
    account = accounts(:valid)

    @controller.cookies[:encrypted] = { account_id: account.id }
    @controller.send :authenticate

    assert_equal account, Current.account
  end
end

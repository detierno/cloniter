# frozen_string_literal: true

require 'test_helper'

class AnonymousAccountTest < ActiveSupport::TestCase
  setup do
    @account = AnonymousAccount.new
  end

  test 'name is "Anonymous"' do
    assert_equal 'Anonymous', @account.name
  end

  test 'is always authenticated' do
    assert_not @account.authenticated?
  end
end

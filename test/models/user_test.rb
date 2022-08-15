# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'valid fixtures' do
    assert users(:valid).valid?
    refute users(:invalid).valid?
  end

  test 'validates name presence' do
    user = User.new
    assert_include_error user, :name, :blank
  end

  test 'validates username presence' do
    user = User.new
    assert_include_error user, :username, :blank
  end

  test 'validates password presence' do
    user = User.new
    assert_include_error user, :password, :blank
  end
end

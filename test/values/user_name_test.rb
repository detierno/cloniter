# frozen_string_literal: true

require 'test_helper'

class UserNameTest < ActiveSupport::TestCase
  test 'presence validation' do
    username = UserName.new('')
    assert_includes username.errors, 'Cannot be blank'
  end

  test 'format validation' do
    username = UserName.new('jonh winter!')
    assert_includes username.errors, 'Invalid format'
  end

  test 'to_s' do
    assert_equal 'jonh_snow', UserName.new('jonh_snow').to_s
  end
end

# frozen_string_literal: true

require 'test_helper'

class NameTest < ActiveSupport::TestCase
  test 'presence validation' do
    name = Name.new('')
    assert_includes name.errors, 'Cannot be blank'
  end

  test 'length validation' do
    name = Name.new('Jy')
    assert_includes name.errors, 'Cannot be less than 3'
  end

  test 'to_s' do
    assert_equal 'Jonh Snow', Name.new('Jonh Snow').to_s
  end
end

# frozen_string_literal: true

require 'test_helper'

class TweetContentTest < ActiveSupport::TestCase
  test 'presence validation' do
    name = TweetContent.new('')
    assert_includes name.errors, 'Cannot be blank'
  end

  test 'length validation' do
    name = TweetContent.new('A' * 141)
    assert_includes name.errors, 'Cannot be more than 140'
  end

  test 'to_s' do
    assert_equal 'this is the content', TweetContent.new('this is the content').to_s
  end
end

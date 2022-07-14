# frozen_string_literal: true

require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  def assert_include_error(record, error, type)
    record.validate
    assert record.errors.of_kind?(error, type)
  end

  test 'valid fixtures' do
    assert tweets(:valid).valid?
    refute tweets(:invalid).valid?
  end

  test 'validates content presence' do
    tweet = Tweet.new
    assert_include_error tweet, :content, :blank
  end

  test 'validates content length' do
    tweet = Tweet.new(content: 'a' * 141)
    assert_include_error tweet, :content, :too_long
  end
end

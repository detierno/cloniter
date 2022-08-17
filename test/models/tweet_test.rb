# frozen_string_literal: true

require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  test 'valid fixtures' do
    assert tweets(:valid).valid?
    assert_not tweets(:invalid).valid?
  end
end

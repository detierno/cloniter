# frozen_string_literal: true

require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  test 'valid fixtures' do
    assert build(:tweet).valid?
    assert_not build(:tweet, :invalid).valid?
  end
end

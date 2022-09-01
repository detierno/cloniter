# frozen_string_literal: true

require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  test 'valid fixtures' do
    assert build(:like).valid?
    assert_not build(:like, :invalid).valid?
  end
end

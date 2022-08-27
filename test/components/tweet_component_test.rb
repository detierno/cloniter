# frozen_string_literal: true

require 'test_helper'

class TweetComponentTest < ViewComponent::TestCase
  def setup
    mock_tweet_class = Struct.new(:content)
    @tweet = mock_tweet_class.new('Tweet content')
  end

  test 'renders tweet content' do
    expected = <<~STR.squish
      <p class="font-normal text-gray-700 dark:text-gray-400">
        Tweet content
      </p>
    STR

    assert_equal(
      expected,
      render_inline(TweetComponent.new(tweet: @tweet)).css('p').to_html.squish
    )
  end
end

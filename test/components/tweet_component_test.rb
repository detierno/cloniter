# frozen_string_literal: true

require 'test_helper'

class TweetComponentTest < ViewComponent::TestCase
  def setup
    # should test against mocks instead ????
    # mock_tweet_class = Struct.new(:content, :account)
    # @tweet = mock_tweet_class.new('Tweet content', 'Account')
    @tweet = create(:tweet)
  end

  test 'renders tweet content' do
    expected = <<~STR.squish
      <p class="font-normal text-gray-700 dark:text-gray-400"> #{@tweet.content} </p>
    STR

    assert_equal(
      expected,
      render_inline(TweetComponent.new(tweet: @tweet)).css('p:last').to_html.squish
    )
  end
end

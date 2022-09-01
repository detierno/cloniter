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
    render_inline(TweetComponent.new(tweet: @tweet, current_account: @tweet.account))
    assert_text(:visible, @tweet.content)
  end
end

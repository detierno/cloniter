# frozen_string_literal: true

require 'application_system_test_case'

class TweetLikeTest < ApplicationSystemTestCase
  def setup
    @john = create(:account, password: 'secret')
    system_login @john, 'secret'

    @samsa = create(:account)
    @tweet = create :tweet, account: @samsa

    @john.follow @samsa
  end

  test 'Liking a tweet' do
    click_on 'Feed'
    find("#tweet_#{@tweet.id}").first('button').click

    assert_css 'a.text-red-500'
  end

  test 'Removing a tweet like' do
    @tweet.add_like(@john)

    click_on 'Feed'
    find("#tweet_#{@tweet.id}").first('a').click

    refute_css 'a.text-red-500'
  end
end

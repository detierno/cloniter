# frozen_string_literal: true

require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  test 'valid fixtures' do
    assert build(:tweet).valid?
    assert_not build(:tweet, :invalid).valid?
  end

  test 'publish call on_tweet_published when saved' do
    tweet = build(:tweet)
    account = tweet.account

    account.expects(:on_tweet_published).with(tweet).once
    tweet.publish
  end

  test 'publish do not call on_tweet_published when not saved' do
    tweet = build(:tweet, :invalid)
    account = tweet.account

    account.expects(:on_tweet_published).never
    tweet.publish
  end

  test 'get like for an account' do
    tweet = create(:tweet)
    account = create(:account)

    like = tweet.likes.create!(account:)

    assert_equal like, tweet.get_like(account)
  end
end

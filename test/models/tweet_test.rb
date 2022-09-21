# frozen_string_literal: true

require 'test_helper'

class TweetTest < ActiveSupport::TestCase
  describe 'factories' do
    it 'behaves as expected' do
      assert build(:tweet).valid?
      assert_not build(:tweet, :invalid).valid?
    end
  end

  describe '.from_accounts' do
    # ???
  end

  describe 'add_like' do
    it 'add like from account' do
      tweet = create :tweet
      account = tweet.account
      likes = mock('LikesCollection')
      other_account = create :account

      tweet.expects(:likes).returns(likes)
      likes.expects(:create!).with(account: other_account).once
      account.expects(:on_tweet_changed).with(tweet).once

      tweet.add_like(other_account)
    end
  end

  describe '#get_like' do
    it 'retrives it when it exists' do
      tweet = create(:tweet)
      account = create(:account)

      like = tweet.likes.create!(account:)

      assert_equal like, tweet.get_like(account)
    end

    it 'retrieve tweet like' do
      tweet = create(:tweet)
      account = create(:account)

      like = tweet.likes.create!(account:)

      assert_equal like, tweet.get_like(account)
    end
  end

  describe '#publish' do
    it 'call on_tweet_published when saved' do
      tweet = build(:tweet)
      account = tweet.account

      account.expects(:on_tweet_published).with(tweet).once
      tweet.publish
    end

    it 'do not call on_tweet_published when not saved' do
      tweet = build(:tweet, :invalid)
      account = tweet.account

      account.expects(:on_tweet_published).never
      tweet.publish
    end
  end
end

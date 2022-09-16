# frozen_string_literal: true

require 'test_helper'

module Tweets
  class LikesControllerTest < ActionDispatch::IntegrationTest
    setup do
      @account = create(:account, password: 'secret')
      sign_in_account @account, 'secret'

      @tweet = create :tweet
    end

    test 'create increases number of likes' do
      assert_changes '@tweet.likes.count', 1 do
        post tweet_likes_path(@tweet)
      end

      assert_response :created
    end

    test 'delete a like decrease the number of likes' do
      @tweet.add_like(@account)

      assert_changes '@tweet.likes.count', -1 do
        delete tweet_like_url(@tweet, @tweet.get_like(@account))
      end

      assert_response :see_other
    end
  end
end

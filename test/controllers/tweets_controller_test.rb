# frozen_string_literal: true

require 'test_helper'

class TweetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = create(:account, password: 'secret')
    sign_in_account @account, 'secret'
  end

  test 'should get tweets index' do
    get tweets_url
    assert_response :success
  end

  test 'get tweets feed' do
    tweet = create(:tweet)
    Tweet.expects(:from_accounts).with(@account.id).once.returns([tweet])

    get tweets_url
    assert_match(/#{tweet.content}/, @response.body)
  end

  test 'tweet creation redirects to tweets path' do
    assert_difference('@account.tweets.count', 1) do
      post tweets_path, params: { tweet: { content: 'my awesome tweet' } }
    end

    assert_redirected_to tweets_path
  end

  test 'tweet creation fails' do
    assert_no_difference('@account.tweets.count') do
      post tweets_path, params: { tweet: { content: '' } }
    end

    assert_response :unprocessable_entity
  end
end

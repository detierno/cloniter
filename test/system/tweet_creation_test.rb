# frozen_string_literal: true

require 'application_system_test_case'

class TweetCreationTest < ApplicationSystemTestCase
  def setup
    account = create(:account, password: 'secret')
    system_login account, 'secret'
  end

  test 'Posting a tweet' do
    click_on 'New Tweet'
    fill_in 'tweet_content', with: 'A bot is posting this'
    click_on 'Post'

    assert_text 'Tweet created'
  end

  test 'Posting an invalid tweet' do
    click_on 'New Tweet'
    fill_in 'tweet_content', with: ''
    click_on 'Post'

    assert_text 'Cannot be blank'
  end
end

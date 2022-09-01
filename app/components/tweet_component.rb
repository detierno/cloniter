# frozen_string_literal: true

class TweetComponent < ViewComponent::Base
  def initialize(tweet:, current_account:)
    super

    @tweet = tweet
    @current_account = current_account
  end
end

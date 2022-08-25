# frozen_string_literal: true

class TweetComponent < ViewComponent::Base
  def initialize(tweet:)
    super

    @tweet = tweet
  end
end

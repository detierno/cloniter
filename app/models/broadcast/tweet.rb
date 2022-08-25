# frozen_string_literal: true

module Broadcast
  class Tweet
    def self.prepend(tweet:, subscriber:)
      new(tweet, subscriber).prepend
    end

    def initialize(tweet, subscriber)
      @tweet = tweet
      @subscriber = subscriber
    end

    def prepend
      Turbo::StreamsChannel.broadcast_prepend_later_to(
        [subscriber, :feed],
        target: 'feed',
        html: rendered_component
      )
    end

    private

    attr_reader :tweet, :subscriber

    def rendered_component
      ApplicationController.render(
        TweetComponent.new(tweet: tweet),
        layout: false
      )
    end
  end
end

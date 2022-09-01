# frozen_string_literal: true

module Broadcast
  class Tweet
    def self.prepend(account:, tweet:, subscriber:)
      new(account, tweet, subscriber).prepend
    end

    def self.replace(account:, tweet:, subscriber:)
      new(account, tweet, subscriber).replace
    end

    def initialize(account, tweet, subscriber)
      @account = account
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

    def replace
      Turbo::StreamsChannel.broadcast_replace_later_to(
        [subscriber, :feed],
        target: @tweet,
        html: rendered_component
      )
    end

    private

    attr_reader :account, :tweet, :subscriber

    def rendered_component
      ApplicationController.render(
        TweetComponent.new(tweet:, current_account: account),
        layout: false
      )
    end
  end
end

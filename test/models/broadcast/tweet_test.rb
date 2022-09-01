# frozen_string_literal: true

require 'test_helper'

module Broadcast
  class TweetTest < ActiveSupport::TestCase
    def setup
      @tweet = mock('Tweet')
      @subscriber = create(:account)

    end

    test '#prepend call broadcast prepend later' do
      component = mock('TweetComponent')
      broadcaster = Broadcast::Tweet.new(@tweet, @subscriber)

      ApplicationController.stubs(:render).returns(component)

      Turbo::StreamsChannel
        .expects(:broadcast_prepend_later_to)
        .with([@subscriber, :feed], target: 'feed', html: component)
        .once

      broadcaster.prepend
    end

    test '#prepend call TweetComponent' do
      component = mock('TweetComponent')
      broadcaster = Broadcast::Tweet.new(@tweet, @subscriber)

      TweetComponent
        .expects(:new)
        .with(tweet: @tweet)
        .once
        .returns('html tweet component')

      ApplicationController
        .expects(:render)
        .once
        .with(
          'html tweet component',
          layout: false
        )

      broadcaster.prepend
    end
  end
end

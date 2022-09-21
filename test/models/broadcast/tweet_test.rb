# frozen_string_literal: true

require 'test_helper'

module Broadcast
  class TweetTest < ActiveSupport::TestCase
    def setup
      @account = mock('Account')
      @tweet = mock('Tweet')
      @subscriber = create(:account)
    end

    test '#prepend call broadcast prepend later' do
      component = mock('TweetComponent')
      broadcaster = Broadcast::Tweet.new(@account, @tweet, @subscriber)

      ApplicationController.stubs(:render).returns(component)

      Turbo::StreamsChannel
        .expects(:broadcast_prepend_later_to)
        .with([@subscriber, :feed], target: 'feed', html: component)
        .once

      broadcaster.prepend
    end

    test '#prepend call TweetComponent' do
      broadcaster = Broadcast::Tweet.new(@account, @tweet, @subscriber)

      TweetComponent
        .expects(:new)
        .with(tweet: @tweet, current_account: @subscriber)
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

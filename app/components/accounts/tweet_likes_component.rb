# frozen_string_literal: true

module Accounts
  class TweetLikesComponent < ViewComponent::Base
    def initialize(account:, tweet:)
      super

      @account = account
      @tweet = tweet
    end

    def call
      tag.p class: 'text-sm text-gray-700 dark:text-gray-400 inline-flex' do
        action + @tweet.likes_count.to_s
      end
    end

    private

    def action
      @tweet.liked_by?(@account) ? delete_link : like_button
    end

    def delete_link
      link_to tweet_like_path(@tweet, @tweet.get_like(@account)), data: { turbo_method: :delete },
                                                                  class: 'text-red-500' do
        render(Primer::IconComponent.new(icon: :heart))
      end
    end

    def like_button
      form_with(url: tweet_likes_path(@tweet)) do
        tag.button render(Primer::IconComponent.new(icon: :heart)), type: :submit
      end
    end
  end
end

# frozen_string_literal: true

module Tweets
  class LikesController < ApplicationController
    include Authentication

    def create
      if tweet.add_like(Current.account)
        redirect_to feed_path, notice: 'Tweet liked'
      else
        flash[:alert] = 'Unable to like tweet'
        redirect_to feed_path, status: :unprocessable_entity
      end
    end

    def destroy
      if tweet.remove_like(Current.account)
        redirect_to feed_path, notice: 'This sucks', status: :see_other
      else
        flash[:alert] = 'Unable to remove tweet like'
        redirect_to feed_path, status: :unprocessable_entity
      end
    end

    private

    def tweet
      @tweet ||= Tweet.find(params[:tweet_id])
    end
  end
end

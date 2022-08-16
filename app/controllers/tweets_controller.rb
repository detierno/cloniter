# frozen_string_literal: true

class TweetsController < ApplicationController
  include Authentication

  def index
    @tweets = Current.account.tweets
  end

  def new
    @tweet = build_tweet
  end

  def create
    @tweet = build_tweet(tweet_params)

    if @tweet.save
      redirect_to tweets_path, notice: 'Tweet created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def build_tweet(attrs = {})
    Current.account.tweets.build(attrs)
  end

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end

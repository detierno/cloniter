# frozen_string_literal: true

class Account < ApplicationRecord
  attribute :name, Types::Name.new
  attribute :username, Types::UserName.new

  has_secure_password :password

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  has_many :tweets, dependent: :destroy

  has_many :followers, dependent: :destroy

  has_many :subscribed_accounts,
           class_name: 'Follower',
           foreign_key: :subscriber_id,
           dependent: :destroy,
           inverse_of: :subscriber

  has_many :subscribers, through: :followers

  with_options value: true do
    validates :name
    validates :username
  end

  scope :all_except, ->(account) { where.not(id: account.id) }

  def authenticated? = true

  def build_tweet(attr = {}) = tweets.build(attr)

  def feed = Tweet.from_accounts(subscribed_accounts.pluck(:account_id))

  def follow(account) = subscribed_accounts.subscribe(account)

  def follows?(account) = subscribed_accounts.subscribed?(account)

  def on_tweet_published(tweet)
    subscribers.each { |sub| Broadcast::Tweet.prepend(tweet: tweet, subscriber: sub) }
  end

  def unfollow(account) = subscribed_accounts.unsubscribe(account)
end

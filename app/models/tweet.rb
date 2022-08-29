# frozen_string_literal: true

class Tweet < ApplicationRecord
  attribute :content, Types::TweetContent.new

  belongs_to :account

  validates :content, value: true

  scope :from_accounts, ->(account_ids) { includes(account: :avatar_attachment).where(account_id: account_ids) }

  def author = account.name

  def publish = save.tap { |saved| broadcast_to_subscribers if saved }

  private

  def broadcast_to_subscribers
    account.subscribers.each { |sub| Broadcast::Tweet.prepend(tweet: self, subscriber: sub) }
  end
end

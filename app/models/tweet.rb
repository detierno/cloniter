# frozen_string_literal: true

class Tweet < ApplicationRecord
  attribute :content, Types::TweetContent.new

  belongs_to :account

  validates :content, value: true

  def self.from_accounts(account_ids)
    includes(account: :avatar_attachment)
      .where(account_id: account_ids)
      .order(created_at: :desc)
  end

  def author = account.name

  def publish = save.tap { |saved| account.on_tweet_published(self) if saved }
end

# frozen_string_literal: true

class Tweet < ApplicationRecord
  attribute :content, Types::TweetContent.new

  belongs_to :account

  has_many :likes, dependent: :destroy

  validates :content, value: true

  def self.from_accounts(account_ids)
    includes(account: :avatar_attachment)
      .where(account_id: account_ids)
      .order(created_at: :desc)
  end

  def add_like(account)
    likes.create!(account:)
    account.on_tweet_changed(self)
  end

  def author = account.name

  def get_like(account) = likes.find_by(account:)

  def liked_by?(account) = likes.exists?(account:)

  def publish = save.tap { |saved| account.on_tweet_published(self) if saved }

  def remove_like(account)
    likes.destroy_by(account:)
    account.on_tweet_changed(self)
  end
end

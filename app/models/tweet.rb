# frozen_string_literal: true

class Tweet < ApplicationRecord
  attribute :content, Types::TweetContent.new

  belongs_to :account

  validates :content, value: true

  scope :from_accounts, ->(account_ids) { where(account_id: account_ids) }

  def publish
    save.tap { |saved| broadcast_to_subscribers if saved }
  end

  private

  def broadcast_to_subscribers
    account.subscribers.each { |sub| broadcast_after_to sub, :feed, insert_by: :prepend, target: 'feed' }
  end
end

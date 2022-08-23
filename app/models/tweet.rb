# frozen_string_literal: true

class Tweet < ApplicationRecord
  attribute :content, Types::TweetContent.new

  belongs_to :account

  validates :content, value: true

  scope :from_accounts, ->(account_ids) { where(account_id: account_ids) }

  broadcasts_to ->(tweet) { [tweet.account, :feed] }, insert_by: :prepend, target: 'feed'
end

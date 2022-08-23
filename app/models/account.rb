# frozen_string_literal: true

class Account < ApplicationRecord
  attribute :name, Types::Name.new
  attribute :username, Types::UserName.new

  has_secure_password :password

  has_many :tweets, dependent: :destroy
  has_many :followers, dependent: :destroy

  has_many :subscribed_accounts,
           class_name: 'Follower',
           foreign_key: :subscriber_id,
           dependent: :destroy,
           inverse_of: :subscriber

  with_options value: true do
    validates :name
    validates :username
  end

  scope :all_except, ->(account) { where.not(id: account.id) }

  def authenticated? = true

  def feed = Tweet.from_accounts(subscribed_accounts.pluck(:account_id))

  def follow(account) = subscribed_accounts.subscribe(account)

  def follows?(account) = subscribed_accounts.subscribed?(account)

  # def subscribers = followers.includes(:subscriber).map(&:subscriber)
  def subscribers = Account.find(followers.pluck(:subscriber_id))

  def unfollow(account) = subscribed_accounts.unsubscribe(account)
end

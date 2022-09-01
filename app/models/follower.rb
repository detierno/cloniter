# frozen_string_literal: true

class Follower < ApplicationRecord
  belongs_to :account
  belongs_to :subscriber, class_name: 'Account'

  class << self
    def subscribe(account) = create!(account:)

    def subscribed?(account) = exists?(account_id: account.id)

    def unsubscribe(account) = find_by(account:).destroy
  end
end

# frozen_string_literal: true

module Accounts
  class UnfollowComponent < ViewComponent::Base
    def initialize(account:, current_account:)
      super

      @account = account
      @current_account = current_account
    end

    private

    attr_reader :account, :current_account

    def render?
      current_account.follows?(account)
    end
  end
end

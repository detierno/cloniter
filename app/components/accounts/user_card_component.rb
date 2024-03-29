# frozen_string_literal: true

module Accounts
  class UserCardComponent < ViewComponent::Base
    with_collection_parameter :account

    def initialize(account:, current_account:)
      super

      @account = account
      @current_account = current_account
    end
  end
end

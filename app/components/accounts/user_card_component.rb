# frozen_string_literal: true

module Accounts
  class UserCardComponent < ViewComponent::Base
    def initialize(account:, current_account:)
      super

      @account = account
      @current_account = current_account
    end
  end
end

# frozen_string_literal: true

module Sidebars
  class RegisteredComponent < NavComponent
    def initialize(account:)
      super
      @account = account
    end

    def render?
      @account.authenticated?
    end
  end
end

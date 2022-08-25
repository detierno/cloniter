# frozen_string_literal: true

module Sidebars
  class AnonymousComponent < NavComponent
    def initialize(account:)
      super
      @account = account
    end

    def render?
      !@account.authenticated?
    end
  end
end

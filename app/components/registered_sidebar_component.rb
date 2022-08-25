# frozen_string_literal: true

class RegisteredSidebarComponent < NavComponent
  def initialize(account:)
    super
    @account = account
  end

  def render?
    @account.authenticated?
  end
end

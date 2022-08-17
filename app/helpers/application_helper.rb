# frozen_string_literal: true

module ApplicationHelper
  def current_account
    Current.account || AnonymousAccount.new
  end
end

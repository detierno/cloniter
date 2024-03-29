# frozen_string_literal: true

class AccountsController < ApplicationController
  include Authentication

  def index
    @accounts = Account.all_except(Current.account)
  end
end

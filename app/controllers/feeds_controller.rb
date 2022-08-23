# frozen_string_literal: true

class FeedsController < ApplicationController
  include Authentication

  def index
    @feed = Current.account.feed
  end
end

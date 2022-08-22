# frozen_string_literal: true

class FollowersController < ApplicationController
  include Authentication

  def create
    if Current.account.follow(account)
      redirect_to accounts_path, notice: 'Account followed'
    else
      flash[:alert] = 'Unable to follow account'
      redirect_to accounts_path, status: :unprocessable_entity
    end
  end

  def destroy
    if Current.account.unfollow(account)
      redirect_to accounts_path, notice: 'Account unfollowed'
    else
      flash[:alert] = 'Unable to unfollow account'
      redirect_to accounts_path, status: :unprocessable_entity
    end
  end

  private

  def account
    @account ||= Account.find(params[:id])
  end
end

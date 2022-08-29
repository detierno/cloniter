# frozen_string_literal: true

class ProfilesController < ApplicationController
  include Authentication

  def edit
    @account = Current.account
  end

  def update
    @account = Current.account

    if @account.update(account_params)
      redirect_to profile_path, notice: 'Account updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :avatar)
  end
end

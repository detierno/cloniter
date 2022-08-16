# frozen_string_literal: true

module Auth
  class RegistrationsController < ApplicationController
    def new
      @account = Account.new
    end

    def create
      @account = Account.new(account_params)

      if @account.save
        cookies.encrypted[:account_id] = @account.id
        redirect_to root_path, notice: 'Account created'
      else
        flash[:alert] = 'Could not create account'
        render :new, status: :unprocessable_entity
      end
    end

    private

    def account_params
      params.require(:account).permit(:name, :username, :password, :password_confirmation)
    end
  end
end

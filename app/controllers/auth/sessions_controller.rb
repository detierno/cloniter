# frozen_string_literal: true

module Auth
  class SessionsController < ApplicationController
    def new; end

    def create
      if authenticated
        cookies.encrypted[:account_id] = account.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:notice] = 'Invalid username or password'
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      cookies.encrypted[:account_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end

    private

    def authenticated
      account.present? && account.authenticate(params[:password])
    end

    def account
      @account ||= Account.find_by(username: params[:username])
    end
  end
end

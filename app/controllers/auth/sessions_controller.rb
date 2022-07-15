# frozen_string_literal: true

module Auth
  class SessionsController < ApplicationController
    def new; end

    def create
      if user.present? && user.authenticate(params[:password])
        cookies.encrypted[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        render :new, alert: 'Invalid username or password'
      end
    end

    def destroy
      cookies.encrypted[:user_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end

    private

    def user
      @user ||= User.find_by(username: params[:username])
    end
  end
end

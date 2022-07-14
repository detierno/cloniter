# frozen_string_literal: true

module Auth
  class SessionsController < ApplicationController
    def new; end

    def create
      user = User.find_by(username: params[:username])

      if user.present? && user.authenticate(params[:password])
        cookies.encrypted[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:alert] = 'Invalid username or password'
        render :new
      end
    end

    def destroy
      cookies.encrypted[:user_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end
  end
end

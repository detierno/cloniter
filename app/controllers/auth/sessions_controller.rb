# frozen_string_literal: true

module Auth
  class SessionsController < ApplicationController
    def new; end

    def create
      if authenticated
        cookies.encrypted[:user_id] = user.id
        redirect_to root_path, notice: 'Logged in successfully'
      else
        flash.now[:notice] = 'Invalid username or password'
        render :new, status: :unprocessable_entity
      end
    end

    def destroy
      cookies.encrypted[:user_id] = nil
      redirect_to root_path, notice: 'Logged Out'
    end

    private

    def authenticated
      user.present? && user.authenticate(params[:password])
    end

    def user
      @user ||= User.find_by(username: params[:username])
    end
  end
end

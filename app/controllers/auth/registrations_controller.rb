# frozen_string_literal: true

module Auth
  class RegistrationsController < ApplicationController
    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        cookies.encrypted[:user_id] = @user.id
        redirect_to root_path, notice: 'Account created'
      else
        flash[:alert] = 'Could not create account'
        render :new, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end
  end
end

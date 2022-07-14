# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

  def authenticate
    if (user = User.find_by(id: cookies.encrypted[:user_id]))
      Current.user = user
    else
      redirect_to sign_in_path, alert: 'You must be signed in'
    end
  end
end

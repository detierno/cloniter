# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticate
  end

  private

  def authenticate
    if (account = Account.find_by(id: cookies.encrypted[:account_id]))
      Current.account = account
    else
      redirect_to sign_in_path, alert: 'You must be signed in'
    end
  end
end

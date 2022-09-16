# frozen_string_literal: true

module Support
  module AuthenticationHelpers
    def sign_in_account(account, password)
      post sign_in_path, params: { username: account.username, password: password }
    end
  end
end

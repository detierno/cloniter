# frozen_string_literal: true

module Support
  module AuthenticationHelpers
    def sign_in_account(account, password)
      post sign_in_path, params: { username: account.username, password: }
    end

    def system_login(account, password)
      visit sign_in_path

      fill_in 'Username', with: account.username
      fill_in 'Password', with: password

      click_on 'Log In'
    end
  end
end

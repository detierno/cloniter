# frozen_string_literal: true

require 'application_system_test_case'

class LoginTest < ApplicationSystemTestCase
  test 'account login' do
    account = create(:account)
    account.update!(password: 'secret')

    visit sign_in_path

    fill_in 'Username', with: account.username
    fill_in 'Password', with: 'secret'

    click_on 'Log In'

    assert_text 'Logged in successfully'
  end

  test 'account login with wrong credentials' do
    account = create(:account)

    visit sign_in_path

    fill_in 'Username', with: account.username
    fill_in 'Password', with: 'oops'

    click_on 'Log In'

    assert_text 'Invalid username or password'
  end
end

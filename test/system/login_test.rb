# frozen_string_literal: true

require 'application_system_test_case'

class LoginTest < ApplicationSystemTestCase
  test 'user login' do
    user = users(:valid)
    user.update!(password: 'secret')


    visit sign_in_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'secret'

    click_on 'Log In'

    assert_text 'Logged in successfully'
  end
end

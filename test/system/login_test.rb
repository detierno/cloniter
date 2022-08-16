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

  test 'user login with wrong credentials' do
    user = users(:valid)

    visit sign_in_path

    fill_in 'Username', with: user.username
    fill_in 'Password', with: 'oops'

    click_on 'Log In'

    assert_text 'Invalid username or password'
  end
end

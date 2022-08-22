# frozen_string_literal: true

require 'application_system_test_case'

class SignUpTest < ApplicationSystemTestCase
  test 'user sign up' do
    visit sign_up_path

    fill_in 'Name', with: 'Jon Snow'
    fill_in 'Username', with: 'king_of_north'
    fill_in 'Password', with: 'doggydogo'
    fill_in 'Password confirmation', with: 'doggydogo'

    click_on 'Sign in'

    assert_text 'Account created'
  end

  test 'user sign up with wrong credentials' do
    visit sign_up_path

    fill_in 'Name', with: 'Jon Snow'
    fill_in 'Username', with: 'King @>!'
    fill_in 'Password', with: 'doggydogo'
    fill_in 'Password confirmation', with: 'doggydogo'

    click_on 'Sign in'

    assert_text 'Invalid format'
  end
end

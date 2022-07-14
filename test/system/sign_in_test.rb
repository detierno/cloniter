# frozen_string_literal: true

require 'application_system_test_case'

class SignInTest < ApplicationSystemTestCase
  test 'user sign in' do
    visit sign_up_path

    fill_in 'Name', with: 'John Snow'
    fill_in 'Username', with: 'king_of_north'
    fill_in 'Password', with: 'doggydogo'
    fill_in 'Password confirmation', with: 'doggydogo'

    click_on 'Sign in'

    assert_text 'My Feed'
  end
end

# frozen_string_literal: true

require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = create(:account, password: 'secret')
    sign_in_account @account, 'secret'
  end

  test 'retrieve edit profile page correctly' do
    get profile_path
    assert_response :success
  end

  test 'update profile infos' do
    patch profile_path, params: { account: { name: 'John king of north' } }
    assert_response :no_content
  end

  test 'has unprocessable_entity with wrong params' do
    patch profile_path, params: { account: { name: '' } }
    assert_response :unprocessable_entity
  end
end

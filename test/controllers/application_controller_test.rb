# frozen_string_literal: true

require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    account = create(:account)
    sign_in_account account, self

    get accounts_url
    assert_response :success
  end
end

# frozen_string_literal: true

require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @account = create(:account, password: 'secret')
    sign_in_account @account, 'secret'
  end

  test 'should get accounts index' do
    get accounts_url
    assert_response :success
  end

  test 'should call Account.all_except' do
    Account.expects(:all_except).with(@account).once
    get accounts_url
    assert_response :success
  end
end

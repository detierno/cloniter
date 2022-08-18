require "test_helper"

class AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    sign_in_account accounts(:valid), self

    get accounts_url
    assert_response :success
  end
end

# frozen_string_literal: true

module Support
  module AuthenticationHelpers
    def sign_in_account(account, test_instance)
      controller_klass = test_instance.class_name.gsub('Test', '').constantize

      Current.stubs(:account).returns(account)
      controller_klass.any_instance.stubs(:authenticate)
    end
  end
end

module Support
  module AuthenticationHelpers
    def sign_in_user(user, test_instance)
      controller_klass = test_instance.class_name.gsub('Test', '').constantize

      Current.stubs(:user).returns(user)
      controller_klass.any_instance.stubs(:authenticate)
    end
  end
end

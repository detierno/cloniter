# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require 'mocha/minitest'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/rails'

require 'support/authentication_helpers'

module ActiveSupport
  class TestCase
    include Support::AuthenticationHelpers

    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    include FactoryBot::Syntax::Methods

    def assert_include_error(record, error, type)
      record.validate
      assert record.errors.of_kind?(error, type)
    end
  end
end

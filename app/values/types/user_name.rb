# frozen_string_literal: true

require_relative '../user_name'

module Types
  class UserName < ActiveModel::Type::Value
    def cast(value)
      value.nil? ? Blank.new : UserName(value)
    end

    def serialize(value)
      value.to_s
    end
  end
end

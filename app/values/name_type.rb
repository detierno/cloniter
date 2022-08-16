# frozen_string_literal: true

require_relative 'name'

class NameType < ActiveModel::Type::Value
  def cast(value)
    value.nil? ? Blank.new : Name(value)
  end

  def serialize(value)
    value.to_s
  end
end

# frozen_string_literal: true

require_relative '../tweet_content'

module Types
  class TweetContent < ActiveModel::Type::Value
    def cast(value)
      value.nil? ? Blank.new : TweetContent(value)
    end

    def serialize(value)
      value.to_s
    end
  end
end

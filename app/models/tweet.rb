# frozen_string_literal: true

class Tweet < ApplicationRecord
  attribute :content, TweetContentType.new

  belongs_to :account

  validates :content, value: true
end

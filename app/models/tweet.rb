# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :account

  validates :content, presence: true, length: { maximum: 140 }
end

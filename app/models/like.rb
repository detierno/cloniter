# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :account
  belongs_to :tweet, counter_cache: true
end

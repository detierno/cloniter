# frozen_string_literal: true

class Follower < ApplicationRecord
  belongs_to :account
  belongs_to :subscriber, class_name: 'Account'
end

# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password :password

  has_many :tweets, dependent: :destroy

  validates :name, presence: true
  validates :username, presence: true
end

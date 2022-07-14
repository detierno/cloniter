# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password :password

  validates :name, presence: true
  validates :username, presence: true
end

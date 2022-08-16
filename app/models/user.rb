# frozen_string_literal: true

class User < ApplicationRecord
  attribute :name, NameType.new
  attribute :username, UserNameType.new

  has_secure_password :password

  has_many :tweets, dependent: :destroy

  validates :name, value: true
  validates :username, presence: true, value: true
end

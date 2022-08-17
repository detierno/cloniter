# frozen_string_literal: true

class Account < ApplicationRecord
  attribute :name, NameType.new
  attribute :username, UserNameType.new

  has_secure_password :password

  has_many :tweets, dependent: :destroy

  with_options value: true do
    validates :name
    validates :username
  end

  def authenticated? = true
end

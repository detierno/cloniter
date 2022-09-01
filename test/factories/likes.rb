# frozen_string_literal: true

FactoryBot.define do
  factory :like do
    account
    tweet

    trait :invalid do
      account { nil }
    end
  end
end

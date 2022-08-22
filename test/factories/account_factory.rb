# frozen_string_literal: true

FactoryBot.define do
  factory :account do
    name { 'Common Peasant' }
    username { 'just_let_go' }
    password { 'testpass' }

    trait :invalid do
      username { '' }
    end

    factory :jon_account do
      name { 'Jon Snow' }
      username { 'kingofnorth' }
    end

    factory :samsa_account do
      name { 'Samsa Stark' }
      username { 'scared_to_death' }
    end
  end
end

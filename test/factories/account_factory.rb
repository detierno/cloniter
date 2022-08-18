FactoryBot.define do
  factory :account do
    name { 'Common Peasant' }
    username { 'just_let_go' }
    password { 'testpass' }

    trait :invalid do
      username { '' }
    end

    factory :john_account do
      name { 'John Snow' }
      username { 'kingofnorth' }
    end

    factory :samsa_account do
      name { 'Samsa Stark' }
      username { 'scared_to_death' }
    end
  end
end

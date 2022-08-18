FactoryBot.define do
  factory :tweet do
    account
    content { 'Some non hateful tweet content' }
  end

  trait :invalid do
    content { 'A' * 141 }
  end
end

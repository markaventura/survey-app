FactoryGirl.define do
  factory :question do
    question Faker::Name.title

    trait :default do
      default_question true
    end
  end
end

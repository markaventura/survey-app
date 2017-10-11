FactoryGirl.define do
  factory :response_question do
    answer Faker::Name.name
    default_question false
  end
end

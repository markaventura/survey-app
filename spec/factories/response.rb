FactoryGirl.define do
  factory :response do
    respondent_name Faker::Name.name
    name Faker::Name.title
  end
end

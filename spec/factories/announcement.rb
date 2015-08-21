FactoryGirl.define do
  factory :announcement do
    sequence(:date)      { |n| Date.new - n }
    sequence(:title)     { |n| "title#{n}" }
    notes   Faker::Lorem.paragraph
  end
end

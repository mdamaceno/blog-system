FactoryGirl.define do
  factory :category, class: Blog::Category do
    name Faker::Name.name
    description Faker::Lorem.sentence(3, true)
  end
end

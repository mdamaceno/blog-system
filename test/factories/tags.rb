FactoryGirl.define do
  factory :tag, class: Blog::Tag do
    name Faker::Name.name
  end
end

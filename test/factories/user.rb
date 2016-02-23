FactoryGirl.define do
  factory :user, class: Blog::User do
    firstname Faker::Name.first_name
    lastname Faker::Name.last_name
    email Faker::Internet.email
    password Faker::Internet.password
    role 'guest'
    status true
    confirmed true
  end
end

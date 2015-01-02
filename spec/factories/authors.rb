require 'faker'

FactoryGirl.define do
  factory :author do |a|
    a.author_first { Faker::Name.first_name }
    a.author_last { Faker::Name.last_name }
    a.title { Faker::Name.prefix }
  end
end
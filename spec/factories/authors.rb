# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :author do
    author_first { Faker::Name.first_name }
    author_last { Faker::Name.last_name }
    title { Faker::Name.prefix }
  end
end

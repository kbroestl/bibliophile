# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :reading do
  	association :book, factory: :book
    rating { Faker::Number.number(1) }
    comments { Faker::Lorem.paragraph }
  end
end

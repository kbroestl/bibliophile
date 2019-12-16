# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :location do
    location { Faker::Lorem.words(number: 1) }
  end
end

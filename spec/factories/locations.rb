# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :location do
    name { Faker::Lorem.words(number: 1) }
  end
end

# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :location do
    location { Faker::Lorem.words(1) }
  end
end

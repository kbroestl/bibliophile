# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :reading do |b|
    b.rating { Faker::Number.number(1) }
    b.comments { Faker::Lorem.paragraph }
  end
end

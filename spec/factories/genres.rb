# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :genre do |b|
    b.genre { Faker::Lorem.words(number: 1) }
    b.readable { %w[0 1].sample }
  end
end

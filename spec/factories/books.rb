# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :book do
    title { Faker::Lorem.words(4).join(' ') }
    publisher { Faker::Company.name + ' ' + Faker::Company.suffix }
    notes { Faker::Lorem.paragraph }
    ISBN { Faker::Code.isbn(13).gsub(/[\D]/, '') }
    pages { Faker::Number.number(3) }
    excluded { %w[0 1].sample }
    association :language, factory: :language
    association :genre, factory: :genre
    association :location, factory: :location
  end
end

# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :book do |b|
    b.title { Faker::Lorem.words(4).join(' ') }
    b.publisher { Faker::Company.name + ' ' + Faker::Company.suffix }
    b.notes { Faker::Lorem.paragraph }
    b.ISBN { Faker::Code.isbn(13).gsub(/[\D]/, '') }
    b.pages { Faker::Number.number(3) }
    b.excluded { %w[0 1].sample }
  end
end

# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :location do |b|
    b.location { Faker::Lorem.words(1) }
    # b.readable { ["0","1"].sample }
  end
end

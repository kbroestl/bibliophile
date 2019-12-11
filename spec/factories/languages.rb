# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :language do |l|
  	l.language { Faker::Lorem.words(1)}
  end
end

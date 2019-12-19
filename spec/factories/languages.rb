# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :language, class: 'Language' do |l|
    l.name { Faker::Lorem.words(number: 1) }
  end
end

require 'faker'

FactoryBot.define do
  factory :genre do |b|
    b.genre {Faker::Lorem.words(1)}
    b.readable { ["0","1"].sample }
  end
end

require 'faker'

FactoryBotRails.define do
  factory :add do
    title { Faker::Title.first_title }
    body { Faker::Body.body_text }
  end
end

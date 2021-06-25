# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    message { Faker::Quote.robin.slice(0, 100) }
    deleted_at  { nil }
  end

  trait :with_deleted do
    deleted_at { 1.day.ago }
  end
end
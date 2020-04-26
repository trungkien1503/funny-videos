# typed: false
# frozen_string_literal: true

FactoryBot.define do
  factory :video do
    user
    link { 'https://www.youtube.com/watch?v=PuJQhtg1VCM' }
    title { 'Top Hits 100 - Top 40 Popular Songs' }
    published_at { 1.year.ago }
    likes { 1000 }
    dislikes { 100 }
    uid { 'PuJQhtg1VCM' }
  end
end

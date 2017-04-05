FactoryGirl.define do
  factory :users do
    provider "github"
    sequence(:uid) { |n| "#{n}" }
    sequence(:username) { |n| "person#{n}" }
    sequence(:email) { |n| "person#{n}@launchacademy.com" }
    avatar_url "https://avatars2.githubusercontent.com/u/174825?v=3&s=400"
  end
end

FactoryBot.define do
  factory :user, aliases: %i[creator attendee] do
    sequence(:username) { |n| "New username#{n}" }
  end
end

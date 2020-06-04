FactoryBot.define do
  factory :user, aliases: [:creator, :attendee] do
    username { "User1" }
  end
end

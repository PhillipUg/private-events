FactoryBot.define do
  factory :user, aliases: %i[creator attendee] do
    username { 'User1' }
  end
end

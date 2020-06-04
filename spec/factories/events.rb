FactoryBot.define do
  factory :event, aliases: [:attended_event, :created_event] do
    creator
    name { "My new Event" }
    start_date { "2020-06-03 21:05:42" }
    location { "My new Location" }
  end
end

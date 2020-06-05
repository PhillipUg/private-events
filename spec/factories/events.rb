FactoryBot.define do
  factory :event, aliases: %i[attended_event created_event] do
    creator
    name { 'My New Event' }
    start_date { '2020-06-03 21:05:42' }
    location { 'My new Location' }
  end
end

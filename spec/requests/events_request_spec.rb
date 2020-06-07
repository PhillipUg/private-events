require 'rails_helper'

RSpec.describe 'Events', type: :request do
  let(:user) { User.create(username: 'Tommy') }
  let(:event1) { Event.create(name: 'Sample Event', location: 'sample Location', start_date: '2020-06-03 21:05:42', creator: user) } # rubocop:disable Layout/LineLength
  
  describe 'GET /index' do
    it 'returns all events' do
      user = create(:user)
      create(:event, creator: user)
      get events_path
      expect(response).to be_successful
      expect(response.body).to include('My new Location')
    end
  end

  describe 'GET /new' do
    it 'should return a redirect status code' do
      get new_event_path
      expect(response).to have_http_status(302)
    end
  end

  describe 'POST /create' do
    it 'should create a new event' do
      expect { event1 }.to change { Event.count }.by(1)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      user = create(:user)
      event = create(:event, creator: user)
      get event_path(event)
      expect(response).to be_successful
      expect(response.body).to include(event.name)
    end
  end
end

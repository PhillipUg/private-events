require 'rails_helper'

RSpec.feature 'Events feature', type: :feature do
  # let(:user5) {User.new(username: 'Lommy')}
  scenario 'should display all events on root_path' do
    visit root_path
    expect(page).to have_content('All Events')
    expect(page).to have_content('Home')
  end

  scenario 'should redirect you to login page when you try to create event' do
    visit(new_event_path)

    expect(current_path).to eq('/login')
  end

  scenario 'should create event' do
    create_user('Tommy')
    signin_user('Tommy')
    visit(new_event_path)

    event = build(:event)
    create_event(event.name, event.location, event.start_date)

    expect(page).to have_content('Event Successfully Created!')
    expect(page).to have_content("Event: #{event.name}")
    # click_on "Sign Out"
  end
end
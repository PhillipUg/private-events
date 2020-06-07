RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def create_user(username)
  visit new_user_path
  fill_in 'username', with: username
  click_button 'Sign Up'
end

def signin_user(username)
  visit login_path
  fill_in 'username', with: username
  click_button 'Login'
end

def create_event(name, location, date)
  visit new_event_path
  fill_in 'name', with: name, visible: true
  fill_in 'location', with: location
  fill_in 'start_date', with: date
  click_on 'Create Event'
end

# def signout_user
#   visit logout_path
# end

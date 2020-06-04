require 'rails_helper'

RSpec.describe Attendance, type: :model do
  subject(:user1) { create(:attendee) }
  subject(:user2) { create(:creator, username: :Tommy) }
  subject(:event1) { create(:attended_event, creator: user2) }
  subject { create(:attendance, attended_event: event1, attendee: user1) }

  describe 'validations' do
    it { should validate_uniqueness_of(:attendee).on(:already_attended?) }
  end

  describe 'associations' do
    it { should belong_to(:attended_event) } 
    it { should belong_to(:attendee) } 
  end
end

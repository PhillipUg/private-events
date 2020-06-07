require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:location) }
    it { should validate_uniqueness_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:creator) }
    it { should have_many(:attendances) }
    it { should have_many(:attendees).through(:attendances) }
  end
end

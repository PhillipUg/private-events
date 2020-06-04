require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do    
  	it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe 'associations' do

    it { should have_many(:created_events) }
    it { should have_many(:attended_events).through(:attendances) }
    it { should have_many(:attendances) }
  end 
end

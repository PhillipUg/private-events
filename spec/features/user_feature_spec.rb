require 'rails_helper'

RSpec.feature "User features", type: :feature do

	feature "Signing Up User" do

		scenario "with invalid params" do
			create_user("")

			expect(current_path).to eq("/users")
			expect(page).to have_content("Username Cant be Blank!")
		end

		scenario 'with valid params' do
			create_user("Tommy")

			expect(current_path).to eq("/")
			expect(page).to have_content("User Successfully Created!")
		end

	end

	feature "Signing in User" do
		background do
			User.create!(username: 'Greg')
		end
		scenario "with correct credentials" do
			signin_user("Greg")

			expect(current_path).to eq("/users/#{User.find_by(username: :Greg).id}")
			expect(page).to have_content("Successfully Logged In")
		end

		scenario "without correct credentials" do
			signin_user("Edgar")

			expect(current_path).to eq("/login")
			expect(page).to have_content("Incorrect Username. try again.")
		end
	end
end
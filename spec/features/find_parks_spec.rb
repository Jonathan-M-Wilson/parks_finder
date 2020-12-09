require "rails_helper"

RSpec.describe 'As a user,', type: :feature do
  describe 'When I select "Tennessee" from the form and click on "Find Parks"' do
    before :each do
      visit root_path
      select 'Tennessee', from: :state
      click_on 'Find Parks'
    end

    it "I see name, description, direction info, hours of operation, and total number of parks found" do
      expect(page).to have_css(".name")
      expect(page).to have_css(".description")
      expect(page).to have_css(".directions")
      expect(page).to have_css(".hours")
      expect(page).to have_css(".park", count: 16)
      expect(page).to have_content("Total Park Results: 16")
    end
  end
end

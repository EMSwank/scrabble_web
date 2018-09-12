require 'rails_helper'

describe "A visitor" do
  context "visits '/'" do
    it "fills in text box and can validate a valid word" do
      visit '/'

      fill_in :word_search,	with: "foxes"
      click_on "Validate Word"

      expect(page).to have_content("'foxes' is a valid word and its root from is 'fox'") 
    end
  end
end


=begin
Feature:
As a guest user (no sign in necessary)
When I visit "/"
And I fill in a text box with "foxes"
And I click "Validate Word"
Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."

As a guest user
When I visit "/"
And I fill in a text box with "foxez"
And I click "Validate Word"
Then I should see a message that says "'foxez' is not a valid word."
=end

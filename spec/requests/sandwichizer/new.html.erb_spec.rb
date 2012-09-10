require 'spec_helper'

describe "Ordering page" do
  
  it "should be able to choose 1 of 3 sandwiches" do
  	visit new_sandwichizer_path
    page.has_selector?("email")
    choose("Meaty")
    choose("Vegetarian")
    choose("Vegan :(")
    click_button "Sandwich Me!"
  end

end
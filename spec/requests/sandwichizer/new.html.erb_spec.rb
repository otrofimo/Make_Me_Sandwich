require 'spec_helper'

describe "Ordering page" do
  
  it "should be able to choose 1 of 3 sandwiches" do
  	visit new_sandwichizer_path
    check("Meaty")
    check("Vegetarian")
    check("Vegan :(")
  end

end

require 'spec_helper'

describe "Splash page interaction" do
  
  it "is able to go to order page" do
  	visit root_path
  	page.should have_link("Order Now")
  	page.should have_content "Make Me a Sandwich!"
  	click_link "Order Now"
  end

end
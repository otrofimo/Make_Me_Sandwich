require 'spec_helper'

describe Sandwich do
  
  before :each do
  	@sandwich = Sandwich.new(:filling_type => "Meaty")
  end

  it "should be able to display the filling type" do
  	@sandwich.filling_type.should eq("Meaty")
  	@sandwich.filling_type="Vegetarian"
  	@sandwich.filling_type.should eq("Vegetarian")
  end

end

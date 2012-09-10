class SandwichizerController < ApplicationController
  def index
  	@url = root_url
  	@sandwiches = Sandwich.all
  end

  def new
    @sandwich = Sandwich.new()
  end

  def create

  	@sandwich = Sandwich.create(:filling_type => params[:sandwich][:filling_type])
  	@root_url = root_url
  	# @params = params
  	

  	Email.send(params[:Email], params[:sandwich][:filling_type])

  	#redirect_to "sandwichizer#index"
  	
  end

end

class SandwichizerController < ApplicationController
  def index
  	@url = root_url
  	@sandwiches = Sandwich.all
  end

  def new
    @sandwich = Sandwich.new()
  end

  def create
  	@sandwich = Sandwich.new(:filling_type => params[:sandwich][:filling_type])
  	@root_url = root_url
  	# @params = params
  	
  	if Email.valid_email?(params[:Email]) && Email.send(params[:Email], params[:sandwich][:filling_type])
	  	flash[:notice] = "Successfully created..."	
	  else
	  	flash[:notice] = "Please input valid email address"
	  	render "new"
	  end
  end

end

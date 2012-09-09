class SandwichizerController < ApplicationController
  def index
  	@url = root_url
  end

  def new
  		@choices = Options.all	
  end

  def create
  end
end

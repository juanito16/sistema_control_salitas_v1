class WelcomeController < ApplicationController
  def index
  	@active_home="active"
  	@parlos=Parlo.where("country_id=?",1)
  	@parlo = Parlo.all.first	
  end
end

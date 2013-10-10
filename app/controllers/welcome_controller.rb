class WelcomeController < ApplicationController
  def index
  	@active_home="active"
  	@parlos=Parlo.where("country_id=?",1)
  end
end

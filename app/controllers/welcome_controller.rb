class WelcomeController < ApplicationController
  def index
  	@active_home="active"
  	@parlos = Parlo.where("country_id=?",1)
  	@reservations=Reservation.all
  	@reservation = Reservation.new
  end
end

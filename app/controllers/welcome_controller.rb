class WelcomeController < ApplicationController
  def index
  	@active_home="active"
  	@parlos = Parlo.where("country_id=?",1)
  	#@reservations=Reservation.includes(:parlo,:employee).where("parlos.id=? and employees.id=? and parlos.country_id=?",@parlo,1,1)
    @reservation = Reservation.new
  end

  def show_reservations

  		#@reservation_for_parlo=Parlo.includes(:reservations).where(:id=>params[:parlo_id])
  		@reservation_for_parlo=Reservation.includes(:parlo,:employee).where("parlos.id='1'")
  		#Parlo.includes(:reservation).where("reservations='19'").references(:reservations)
	
  
  end

  def create_reservation
    @reservation = Reservation.new(reservation_params)
    @reservation.save
    redirect_to root_path
    
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:parlo_id, :employee_id, :status, :date_reservation, :start_time, :end_time)
    end
end

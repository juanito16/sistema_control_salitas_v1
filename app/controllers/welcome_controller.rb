class WelcomeController < ApplicationController
  layout "sistema_control_salitas"
  
  def index
  	@active_home="active"
  	@parlos = Parlo.where("country_id=?",1)
  	#@reservations=Reservation.includes(:parlo,:employee).where("parlos.id=? and employees.id=? and parlos.country_id=?",@parlo,1,1)
    @reservation_parlo = Reservation.new
  end

  def show_reservations
      @reservation_for_parlo=Reservation.includes(:parlo,:employee).where("parlos.id=?",params[:id])    
  end

  def create_reservation
    @reservation_new = Reservation.new(reservation_params)
    @reservation_new.save
    redirect_to welcome_index_path, notice: 'Reservation was successfully created.'    
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def reservation_params
      params.require(:reservation).permit(:parlo_id, :employee_id, :status, :date_reservation, :start_time, :end_time)
    end
end

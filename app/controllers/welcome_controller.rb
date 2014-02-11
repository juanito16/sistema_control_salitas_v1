class WelcomeController < ApplicationController
  before_filter :authenticate_admin!
  layout "sistema_control_salitas"
  
  def index
  	@active_home="active"
    if current_admin.admin_type==1
  	 @parlos = Parlo.where("country_id=?",current_admin.country_id)
    else
      @parlos = Parlo.all
    end
    #parlos_id=Parlo.all
    @reservation_parlo = Reservation.new
    #@reservasions_ocupation=Reservation.includes(:parlo).where("parlos.id=?",parlos_id.id).references(:parlo).limit(2)
  end

  def show_reservations
    if current_admin.admin_type==1
      @reservation_for_parlo=Reservation.includes(:parlo,:employee).where("parlos.id=?",params[:id])
    else
      @reservation_for_parlo=Reservation.includes(:parlo,:employee).where("parlos.id=? and employees.country_id=?",params[:id],current_admin.country_id)
    end
    
  end

  def destroy_reservations
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to show_reservations_for_parlo_path(@reservation.parlo.id),notice: "Reservacion Eliminada Exitosamente!"
  end

  def create_reservation
    reservation_new = Reservation.new(reservation_params)
    reservation_for_parlo=Reservation.includes(:parlo).where("parlos.id=?",reservation_new.parlo_id).references(:parlo).last
    if reservation_for_parlo.blank?
       reservation_new.save
       redirect_to welcome_index_path, notice: 'Reservation realizada Exitosamente'
    elsif reservation_new.start_time==reservation_for_parlo.start_time
          redirect_to welcome_index_path
          flash[:error]= 'La Salita Que intento Reservar ya se ecuentra utilizada por: '+reservation_for_parlo.employee.name+""+reservation_for_parlo.employee.lastname
    else
      reservation_new.save
      redirect_to welcome_index_path, notice: 'Reservation realizada Exitosamente'
    end
  end
  
  private
    def reservation_params
      params.require(:reservation).permit(:parlo_id, :employee_id, :status, :date_reservation, :start_time, :end_time)
    end
end

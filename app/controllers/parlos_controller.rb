class ParlosController < ApplicationController
  before_action :set_parlo, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!
  layout "sistema_control_salitas"

  # GET /parlos
  # GET /parlos.json
  def index
    @active_parlos="active"
    @parlos = Parlo.all
    @parlo = Parlo.new
  end

  # GET /parlos/1
  # GET /parlos/1.json
  def show
  end

  # GET /parlos/new
  def new
    @parlo = Parlo.new
  end

  # GET /parlos/1/edit
  def edit
  end

  # POST /parlos
  # POST /parlos.json
  def create
    @parlo = Parlo.new(parlo_params)

    respond_to do |format|
      if @parlo.save
        format.html { redirect_to @parlo, notice: 'Parlo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @parlo }
      else
        format.html { render action: 'new' }
        format.json { render json: @parlo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parlos/1
  # PATCH/PUT /parlos/1.json
  def update
    respond_to do |format|
      if @parlo.update(parlo_params)
        format.html { redirect_to @parlo, notice: 'Parlo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @parlo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parlos/1
  # DELETE /parlos/1.json
  def destroy
    @parlo.destroy
    respond_to do |format|
      format.html { redirect_to parlos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parlo
      @parlo = Parlo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parlo_params
      params.require(:parlo).permit(:name_parlo, :status, :country_id)
    end
end

class AppointmentsController < ApplicationController
  before_action :set_appointment, only: %i[ show edit update destroy ]
  #before we run anything if the user is not signed in show index and show functions
  before_action :authenticate_user!, except: [:index,:show]
  #only the correct user can edit,update and destroy
  before_action :correct_user, only: [:edit, :update , :destroy]

  # GET /appointments or /appointments.json
  def index
    @appointments = Appointment.all.decorate
  end

  # GET /appointments/1 or /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    #@appointment = Appointment.new
    @appointment = current_user.appointments.build
  end

  # GET /appointments/1/edit
  def edit
  end

  #function to allow for search functionality 
  def search
    @appointments = Appointment.where("date LIKE?", "%"+params[:q]+"%")
  end

  # POST /appointments or /appointments.json
  def create
   #@appointment = Appointment.new(appointment_params)
   @appointment = current_user.appointments.build(appointment_params)
   #here underneath I am using my custom gem to filter bad words within the notes field when creating an appointment
   @appointment.notes = Badwordgem::Base.sanitize(@appointment.notes)
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully created." }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1 or /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to appointment_url(@appointment), notice: "Appointment was successfully updated." }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1 or /appointments/1.json
  def destroy
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to appointments_url, notice: "Appointment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

#function here that restricts editing so the current logged in user can edit only their records
def correct_user
  @appointment = current_user.appointments.find_by(id: params[:id])
  redirect_to appointments_path, notice:"NOT ALLOWED TO EDIT THIS" if @appointment.nil?
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appointment_params
      params.require(:appointment).permit(:barber, :customer, :notes, :date,:user_id)
    end
end

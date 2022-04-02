class BarbersController < ApplicationController
  before_action :set_barber, only: %i[ show edit update destroy ]
  #before we run anything if the user is not signed in show index and show functions
  before_action :authenticate_user!, except: [:index,:show]
  #only the correct user can edit,update and destroy
  before_action :correct_user, only: [:edit, :update , :destroy]
  # GET /barbers or /barbers.json
  def index
    
    @barbers = Barber.all.decorate
    #here we use our decorator design pattern when we view the index page of the barber
  end

  # GET /barbers/1 or /barbers/1.json
  def show
      
  end

  # GET /barbers/new
  def new
    #@barber = Barber.new
    @barber = current_user.barbers.build
  end

  # GET /barbers/1/edit
  def edit
  end
  #function to allow for search functionality 
  def search
    @barbers = Barber.where("first_name LIKE?", "%"+params[:q]+"%")
  end

  # POST /barbers or /barbers.json
  def create
    #@barber = Barber.new(barber_params)
    @barber = current_user.barbers.build(barber_params)
    respond_to do |format|
      if @barber.save
        format.html { redirect_to barber_url(@barber), notice: "Barber was successfully created." }
        format.json { render :show, status: :created, location: @barber }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @barber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /barbers/1 or /barbers/1.json
  def update
    respond_to do |format|
      if @barber.update(barber_params)
        format.html { redirect_to barber_url(@barber), notice: "Barber was successfully updated." }
        format.json { render :show, status: :ok, location: @barber }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @barber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /barbers/1 or /barbers/1.json
  def destroy
    @barber.destroy

    respond_to do |format|
      format.html { redirect_to barbers_url, notice: "Barber was successfully destroyed." }
      format.json { head :no_content }
    end
  end
#function here that restricts editing so the current logged in user can edit only their records
  def correct_user
      @barber = current_user.barbers.find_by(id: params[:id])
      redirect_to barbers_path, notice:"NOT ALLOWED TO EDIT THIS" if @barber.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_barber
      @barber = Barber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def barber_params
      params.require(:barber).permit(:first_name, :last_name, :age, :email,:user_id)
    end
end

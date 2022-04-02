class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update destroy ]
   #before we run anything if the user is not signed in show index and show functions
   before_action :authenticate_user!, except: [:index,:show]
   #only the correct user can edit,update and destroy
   before_action :correct_user, only: [:edit, :update , :destroy]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all.decorate
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    #@customer = Customer.new
    @customer = current_user.customers.build
  end

  # GET /customers/1/edit
  def edit
  end

   #function to allow for search functionality 
   def search
    @customers = Customer.where("first_name LIKE?", "%"+params[:q]+"%")
  end

  # POST /customers or /customers.json
  def create
    #@customer = Customer.new(customer_params)
    @customer = current_user.customers.build(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully created." }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

#function here that restricts editing so the current logged in user can edit only their records
def correct_user
  @customer = current_user.customers.find_by(id: params[:id])
  redirect_to customers_path, notice:"NOT ALLOWED TO EDIT THIS" if @customer.nil?
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :age, :email,:user_id)
    end
end

class DojotsController < ApplicationController
  before_action :set_dojot, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /dojots or /dojots.json
  def index
    @dojots = Dojot.all
  end

  # GET /dojots/1 or /dojots/1.json
  def show
  end

  # GET /dojots/new
  def new
    #@dojot = Dojot.new
    @dojot = current_user.dojots.build
  end

  # GET /dojots/1/edit
  def edit
  end

  # POST /dojots or /dojots.json
  def create
    #@dojot = Dojot.new(dojot_params)
    @dojot = current_user.dojots.build(dojot_params)

    respond_to do |format|
      if @dojot.save
        format.html { redirect_to dojot_url(@dojot), notice: "Dojot was successfully created." }
        format.json { render :show, status: :created, location: @dojot }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dojot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dojots/1 or /dojots/1.json
  def update
    respond_to do |format|
      if @dojot.update(dojot_params)
        format.html { redirect_to dojot_url(@dojot), notice: "Dojot was successfully updated." }
        format.json { render :show, status: :ok, location: @dojot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dojot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dojots/1 or /dojots/1.json
  def destroy
    @dojot.destroy

    respond_to do |format|
      format.html { redirect_to dojots_url, notice: "Dojot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @dojot = current_user.dojots.find_by(id: params[:id])
    redirect_to dojots_path, notice: "Not Authorize to Edit!" if @dojot.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dojot
      @dojot = Dojot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dojot_params
      params.require(:dojot).permit(:first_name, :last_name, :email, :phone, :twitter, :user_id)
    end
end

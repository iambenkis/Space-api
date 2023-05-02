class Api::V1::RocketsController < ApplicationController
    before_action :set_rocket, only: %i[ show update destroy ]
    before_action :authorize
    

    def  my_rockets
      rockets = Rocket.all.where(user_id: params[:id])
      render json: rockets
    end

    def reserved
      
    end

    # GET /rockets
    def index
      @rockets = @user.rockets.all
      render json: @rockets
    end
  
    # GET /rockets/1
    def show
      render json: @rocket
    end
  
    # POST /rockets
    def create
      @rocket = Rocket.new(rocket_params.merge(user: @user)) 
  
      if @rocket.save
        render json: @rocket, status: :created
      else
        render json: @rocket.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /rockets/1
    def update
      if @rocket.update(rocket_params)
        render json: @rocket
      else
        render json: @rocket.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /rockets/1
    def destroy
      @rocket.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
    def set_rocket
        @rocket = @user.rockets.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rocket_params
        # params.require(:rocket).permit(:name, :description, :status, :image)
        params.permit(:name, :description, :status, :image)
    end
end
  
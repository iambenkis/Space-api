class Api::V1::RocketsController < ApplicationController
    before_action :set_rocket, only: %i[ show update destroy ]

    # GET /rockets
    def index
      @rockets = Rocket.all
  
      render json: @rockets
    end
  
    # GET /rockets/1
    def show
      render json: @rocket
    end
  
    # POST /rockets
    def create
      @rocket = Rocket.new(rocket_params)
  
      if @rocket.save
        render json: @rocket, status: :created, location: @rocket
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
        @rocket = Rocket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rocket_params
        params.require(:rocket).permit(:name, :description, :status, :image)
    end
end
  
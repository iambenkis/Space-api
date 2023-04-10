class Api::V1::MissionsController < ApplicationController
    before_action :set_mission, only: %i[ show update destroy ]
    before_action :authorize

    # GET /missions
    def index
      @missions = @user.missions.all
  
      render json: @missions
    end
  
    # GET /missions/1
    def show
      render json: @mission
    end
  
    # POST /missions
    def create
      @mission = Mission.new(mission_params.merge(user: @user)) 
  
      if @mission.save
        render json: @mission, status: :created
      else
        render json: @mission.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /missions/1
    def update
      if @mission.update(mission_params)
        render json: @mission
      else
        render json: @mission.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /missions/1
    def destroy
      @mission.destroy
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_mission
        @mission = @user.missions.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def mission_params 
        params.permit(:name, :description, :status)
      end
  end
  
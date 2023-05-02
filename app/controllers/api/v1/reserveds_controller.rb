class Api::V1::ReservedsController < ApplicationController
  before_action :set_reserved, only: %i[ show update destroy ]
  before_action :authorize

  # GET /reserveds
  def index
    @reserveds = Reserved.all

    render json: @reserveds
  end

  # GET /reserveds/1
  def show
    render json: @reserved
  end

  # POST /reserveds
  def create
    @reserved = Reserved.new(reserved_params.merge(user: @user))

    if @reserved.save
      render json: @reserved, status: :created 
    else
      render json: @reserved.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reserveds/1
  def destroy
    @reserved.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserved
      @reserved = Reserved.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reserved_params
      params.permit(:rocket_id)
    end
end

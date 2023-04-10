class Api::V1::UsersController < ApplicationController
    before_action :find_user , except: %i[login]

    def login
      @user =  User.find_by(email: user_params[:email])

      if @user && @user.authenticate(user_params[:password])
          token = encode_token({ user_id: @user.id })
          render json: { user: @user, token: token }, status: :ok
      else
          render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
      end
    end

    private

    def user_params 
      params.permit(:email, :password)
    end

    def find_user
      @user = User.find_by_email!(params[:_email])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
    end
end
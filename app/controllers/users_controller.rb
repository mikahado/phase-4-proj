class UsersController < ApplicationController

    # signup

    def create 
        user = User.create(user_params)
        if user.valid? 
            session[:user_id] = user.id
            render json: user
        else 
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def show
        user = User.find_by(id: session[:user_id])
        if user
            render json: user
        else 
            render json: {error: "Not authorized, kiddo."}, status: :unauthorized
        end
# get current user and render in json
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation)
    end

end
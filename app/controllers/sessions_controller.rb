class SessionsController < ApplicationController

    # login

    def create 
        user = User.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:user_id] = user.id
            render json: user
        else
            render json: {error: "Invalid username or password"}, status: :unauthorized
        end 
    end

    def destroy 
        session.delete(:user_id)
        # content :no_head
    end

    private

    # def user_params
    #     params.permit(:username)
    # end

end

class SessionsController < ApplicationController
   
    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            else
        end
    end

    def destroy
        session.clear
        redirect_to '/'
    end

end

class SessionsController < ApplicationController
   
    # logins user
    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
            else
            flash[:message] = "Invalid information. Please try again"
            redirect_to '/login'
        end
    end

    # logouts user
    def destroy
        session.clear
        redirect_to '/'
    end

    # login via Google 
    def google
        # should the User's login information persist in db?
        # find or create by email or uid? 
        # If by uid I have to add uid and provide column to users table
        # should User login via omniauth always?
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.username = auth["info"]["name"]
            user.password = SecureRandom.hex(10)
        end
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to '/'
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end

class SessionsController < ApplicationController
    def new
        
    end
    
    def create
       user = User.find_by(email: params[:session][:email].downcase)
       
       if user && user.authenticate(params[:session][:password])
           create_session user
           flash[:notice] = "Welcome, #{user.name}!"
           redirect_to root_path
       else
           flash[:error] = 'Invalid email/password combination'
           render :new
       end
    end
    
    def avatar_url(user)
       gravatar_id = Digest::MDS::hexdigest(user.email).downcase
       "http://gravatar.com/avatar/#{gravatar_id}.png?s=48"
    end
    
    def destroy
       destroy_session(current_user)
       flash[:notice] = "You've been signed out come back soon!"
       redirect_to root_path
    end
end

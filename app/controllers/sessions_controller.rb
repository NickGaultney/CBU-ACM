class SessionsController < ApplicationController
	skip_before_action :authorized, only: [:new, :create]

	def new
	end

	def create
		@user = User.find_by(username: params[:username])
		if @user && @user.authenticate(params[:password]) 
			if @user.email_confirmed
				session[:user_id] = @user.id
	        	Rails.logger.info "*** Successully Logged In! ***"
	        	redirect_to root_path
        	else
        		flash.now[:error] = 'Please activate your account by following the 
        		instructions in the account confirmation email you received to proceed'
        		Rails.logger.info "*** Account not Activated! ***"
        		render :new
        	end
		else
			flash.now[:error] = 'Invalid email/password combination' # Not quite right!
			Rails.logger.info "*** Invalid password or username ***"
        	render :new
		end
	end

	def logout
		session[:user_id] = nil
		redirect_to root_path
	end

	def login
	end
end

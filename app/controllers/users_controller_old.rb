class UsersController < ApplicationController
	CODE = "CBUACM41434D"
	skip_before_action :authorized, only: [:new, :create]

	def officers
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		params[:user][:officer] = params[:officer_code] == CODE
		@user = User.create(params.require(:user).permit(:username, :password, :officer_code, :officer))
		session[:user_id] = @user.id
		redirect_to root_path
	end

end

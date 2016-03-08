class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			login(@user)
			flash[:success] = "Successfully created"
			redirect_to @user
		else
			flash[:error] = "Try again"
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		@events = Event.all
	end

	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end

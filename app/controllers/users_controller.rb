class UsersController < ApplicationController

	before_action :set_user, only: %w[show edit update destory]
	before_action :require_user, only: %w[new create edit update destroy show index]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			flash[:success] = "#{@user.name}, welcome to Alpha Blog!"
			redirect_to root_path#user_path(@user)
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			flash[:success] = 'User information updated Successfully!'
			redirect_to user_path(@user)
		else
			render :edit
		end
	end

	def destory
		@user.destory
		flash[:success] = 'User account deleted Successfully!'
		redirect_to root_path
	end

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :email, :mobile_no, :password)
	end
end
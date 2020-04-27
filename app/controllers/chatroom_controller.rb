class ChatroomController < ApplicationController

	before_action :require_user, only: %w[index]

	def index
		@message = Message.new
		@messages = Message.all
	end

	def new

	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	def home
	end

end
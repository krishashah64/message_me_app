class MessagesController < ApplicationController

	before_action :require_user

	# def new
	# 	@message = Message.new
	# end

	def create
		message = current_user.messages.build(message_params)
		if message.save
			ActionCable.server.broadcast 'chatroom_channel', mod_message: message_render(message)
		else
			flash[:error] = 'You cannot send empty message'
 		end
	end

	# def show
	# end

	private

	def message_params
		params.require(:message).permit(:body)
	end

	def message_render(message)
		render(partial: 'message', locals: { message: message })
	end
end
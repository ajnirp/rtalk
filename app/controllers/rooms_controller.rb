class RoomsController < ApplicationController
	include RoomsHelper
	def create
		
	end

	def destroy
		
	end

	# helper_method :generate_random_url
	def set_name
		cookies[:user_name] = params[:name]
		self.key = generate_random_url
		redirect_to room_path(@key)
	end

	def new
		@room = Room.new
	end

	def show
		
	end

	private

		def generate_random_url
			letters = ('a'..'z').to_a
			numbers = (0..9).to_a
			"id" + (letters+numbers).sample(25).join
		end
end

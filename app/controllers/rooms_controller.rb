class RoomsController < ApplicationController
	include RoomsHelper
	def create
		
	end

	def destroy
		
	end

	def set_name
		input = params[:name]
		if !(input =~ /^[[:alnum:]]*$/)
			flash[:error] = "Please use only alphabets and numbers in your name"
			redirect_to new_path
		elsif (4..20).include? input.length
			cookies[:user_name] = input
			self.key = generate_random_url
			redirect_to room_path(@key)
		elsif (1..3).include? input.length
			flash[:error] = "Too short! Please choose a longer name (at least 4 characters)"
			redirect_to new_path
		elsif input.length > 20
			flash[:error] = "Too long! Please choose a shorter name (at most 20 characters)"
			redirect_to new_path
		elsif input.length == 0
			flash[:error] = "Please enter a name"
			redirect_to new_path
		end
	end

	def new
		@room = Room.new
	end

	def router
		debugger
		7
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

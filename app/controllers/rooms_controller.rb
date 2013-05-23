class RoomsController < ApplicationController
	include RoomsHelper
	def create
		
	end

	def destroy
		
	end

	def new_router
		validation = validate_name(params[:name], new_path)
		if  validation == "failure"
			redirect_to new_room_path
		elsif validation == "success"
			redirect_to room_path(@key)
		end
	end

	def join_router
		name_validation = validate_name(params[:name], join_path)
		key_validation == "failure" #to change
		if [name_validation, key_validation].include? "failure"
			redirect_to join_room_path
		else
			redirect_to room_path(@key)
		end
	end

	def show
		
	end

	private

		def generate_random_url
			letters = ('a'..'z').to_a
			numbers = (0..9).to_a
			"id" + (letters+numbers).sample(25).join
		end

		def validate_name(input, path)
			if !(input =~ /^[[:alnum:]]*$/)
				flash[:error] = "Please use only alphabets and numbers in your name"
				return "failure"
			elsif (4..20).include? input.length
				cookies[:user_name] = input
				self.key = generate_random_url
				return "success"
			elsif (1..3).include? input.length
				flash[:error] = "Too short! Please choose a longer name (at least 4 characters)"
				return "failure"
			elsif input.length > 20
				flash[:error] = "Too long! Please choose a shorter name (at most 20 characters)"
				return "failure"
			elsif input.length == 0
				flash[:error] = "Please enter a name"
				return "failure"
			end
		end

		def validate_key(key_input)
			#is true if key_input is the key of an existing room
			!(Room.find_by_key(key_input).nil?)
		end
end

require 'securerandom'

class RoomsController < ApplicationController
  def create
  	url = SecureRandom.urlsafe_base64
  end

  def destroy
  end
end

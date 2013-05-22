class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  def about
  	@title = "About"
  end

  def new
    @title = "New Room"
  end

  def join
    @title = "Join"
  end

  def chat
    @title = "Chat"
  end
end

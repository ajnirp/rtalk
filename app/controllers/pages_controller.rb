class PagesController < ApplicationController
  def home
  	@title = "Home"
  end

  def contact
  	@title = "Contact"
  end

  def help
  	@title = "Help"
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
end

class RoomsController < ApplicationController
  def show
    unless logged_in?
      session[:callback]=root_path
      return redirect_to login_path
    end
    @messages = Message.all
  end
end

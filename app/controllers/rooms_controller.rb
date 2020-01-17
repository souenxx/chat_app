class RoomsController < ApplicationController
  def show
    if logged_in?
      #@message=current_user.messages.build
      @messages = Message.all.order(:created_at)
    end
  end
end

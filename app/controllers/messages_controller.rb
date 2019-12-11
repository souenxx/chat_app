class MessagesController < ApplicationController
  before_action :logged_in_user, only:[:create, :destroy]
  
  def create
    @message=current_user.messages.build(message_params)
    #@content = Message.new(content: "11", user_id: 1)
    if @message.save
      flash[:success]="Message created!"
      redirect_to root_url
    else
      render 'rooms/show'
    end
  end
  
  def destroy
  end
  
  private
    def message_params
      params.require(:message).permit(:content)
    end
end

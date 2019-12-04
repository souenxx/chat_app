class UsersController < ApplicationController
  before_action :login_required, only:[:show]

  
  def new
    @user=User.new
  end
  
  def show
    @user=User.find(params[:id])
  end
  
  def create
    @user=User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Chat APP"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
    
    def login_required
      redirect_to login_path unless current_user
    end
end

class UsersController < ApplicationController
  before_action :login_required, only:[:show,:update,:index]

  def index
    @users=User.all
  end
  
  def new
    @user=User.new
  end
  
  def show
    @user=User.find(params[:id])
  end
  
  def create
    @user=User.new(user_params)
    #@user.picture = "ahiru.png"
    
    if @user.save
      log_in @user
      flash[:success] = "Chat APPへようこそ"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user=User.find(params[:id])
    #@user.picture="kid.png"
  end
  
  def update
    @user=User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success]="プロフィールが更新されました"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation,:picture)
    end
    
    def login_required
      redirect_to login_path unless current_user
    end
    
    def correct_user
      @user=User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end

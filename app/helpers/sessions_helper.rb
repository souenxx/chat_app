module SessionsHelper
  
  #受け取ったユーザでログイン
  def log_in(user)
    session[:user_id]=user.id
  end
  
  #現在ログインしているユーザを返す(いる前提)
  def  current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  #ユーザがログインしているかどうか
  def logged_in?
    !current_user.nil?
  end
  
  #現在のユーザをログアウト
  def log_out
    session.delete(:user_id)
    @current_user=nil
  end
end

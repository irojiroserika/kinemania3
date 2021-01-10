class ApplicationController < ActionController::Base
  
before_action :set_current_user

def set_current_user  
  @current_user = User.find_by(id: session[:user_id])
end

def authenticate_user
  if @current_user == nil 
    flash[:notice] = "ログインが必要です"
    redirect_to("/login")
  elsif @current_user.name =="irojiroserika"
  elsif @current_user.name =="admin"
  else
    flash[:notice] = "あなたは編集ができません"
    redirect_to("/login")
  end
  
end




end

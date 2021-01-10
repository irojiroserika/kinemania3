class UsersController < ApplicationController
  def new
  end
  
  def index
    @users = User.all
  end
  
  def login
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/contents/index")
    else
      flash[:notice] = "ログインできませんでした"
      render("users/login_form")
    end
  end
  
  def logout
    session[:user_id] = nil
    redirect_to("/")
  end
  
  def login_form
  end
  
  def create
    @user = User.new(name: params[:name],email: params[:email])
    if @user.save
      redirect_to("/contents/index")
    else
      
      redirect_to("/users/new")
    end
    
  end

end

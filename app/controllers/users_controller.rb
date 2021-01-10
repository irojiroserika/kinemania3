class UsersController < ApplicationController
  
  before_action :authenticate_user,{only: [:edit,:update,:destroy]}
  
  def new
  end
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find_by(id: params[:id])
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
  
  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    if @user.save
      flash[:notice] = "ユーザーの名前を編集しました"
      redirect_to("/users/index")
    else
      flash[:notice] = "ユーザーの名前を編集できませんでした"
      render("users/index")
    end
  end
  
  def create
    @user = User.new(name: params[:name],email: params[:email])
    if @user.save
      redirect_to("/contents/index")
    else
      
      redirect_to("/users/new")
    end
    
  end
  
  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render("home/top")
  end

end

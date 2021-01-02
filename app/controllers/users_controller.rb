class UsersController < ApplicationController
  def new
  end
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.new(name: params[:name],email: params[:email])
    if @user.save
      redirect_to("/contents/new")
    else
      redirect_to("/users/new")
    end
    
  end

end

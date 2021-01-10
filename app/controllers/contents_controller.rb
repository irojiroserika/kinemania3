class ContentsController < ApplicationController
  before_action :authenticate_user,{only: [:new,:edit,:update,:create,:destroy]}
  before_action :isolate_user,{only: [:new,:edit,:update,:create,:destroy]}
  
  
  def index
    @contents = Content.all.order(watchedday: :asc)
  end
  
  def new
  end
  
  def show
    @content = Content.find_by(id: params[:id])
  end
  
  def edit
    @content = Content.find_by(id: params[:id])
  end
  
  def create
    @content = Content.new(name: params[:name],watchedday: params[:watchedday])
    if @content.save
      redirect_to("/contents/#{@content.id}")
    else
      redirect_to("/contents/#{@content.id}")
    end
  end
  
  def update
    @content = Content.find_by(id: params[:id])
    @content.name = params[:name]
    @content.watchedday = params[:watchedday]
    
    if @content.save
      flash[:notice] = "作品を編集しました"
      redirect_to("/contents/index")
    else
      @content = Content.find_by(id: params[:id])
      render("contents/edit")
    end
  end
  
  def destroy
    @content = Content.find_by(id: params[:id])
    @content.destroy
    render("home/top")
  end
  
end


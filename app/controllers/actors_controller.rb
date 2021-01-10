class ActorsController < ApplicationController
  before_action :authenticate_user,{only: [:new,:edit,:update,:create,:destroy]}
  before_action :isolate_user,{only: [:new,:edit,:update,:create,:destroy]}
  
  def index
    @actors = Actor.all
  end
  
  def show
    @actor = Actor.find_by(id: params[:id])
  end
  
  def edit
    @actor = Actor.find_by(id: params[:id])
  end
    
  def create
    @actor = Actor.new(name: params[:name])
    @content =Content.find_by(id: params[:id])
    @actor.contents << @content
    if @actor.save
      redirect_to("/contents/#{@content.id}")
    else
      @actor = Actor.find_by(name: params[:name])
      @content =Content.find_by(id: params[:id])
      @actor.contents << @content
      @content.save
      redirect_to("/contents/#{@content.id}")
    end
  end
  
  def update
    @actor = Actor.find_by(id: params[:id])
    @actor.name = params[:name]
    #以下activestrageを使用するため無効化
    if params[:image_name]
      @actor.image_name = "#{@actor.id}.jpg"
      image_name = params[:image_name]
      File.binwrite("public/actor_images/#{@actor.image_name}", image_name.read)
    end
   #ここまで
    if @actor.save
      flash[:notice] = "出演者の名前を編集しました"
      redirect_to("/actors/#{@actor.id}")
    else
      @content = Actor.find_by(id: params[:id])
      render("actors/edit")
    end
  end
  
  def destroy
    @actor = Actor.find_by(id: params[:id])
    @actor.destroy
    render("home/top")
  end
  
 
end 

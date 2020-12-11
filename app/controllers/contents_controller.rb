class ContentsController < ApplicationController
  
  
  def index
    @contents = Content.all
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
    if @content.save
      flash[:notice] = "作品を編集しました"
      redirect_to("/contents/index")
    else
      @content = Content.find_by(id: params[:id])
      render("contents/edit")
    end
  end
  
end


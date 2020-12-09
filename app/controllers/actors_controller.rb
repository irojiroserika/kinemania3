class ActorsController < ApplicationController

  
  def index
    @actors = Actor.all
  end
  
  def show
    @actor = Actor.find_by(id: params[:id])
  end
  
  
    
  def create
   @actor = Actor.new(name: params[:name])
   @content =Content.find_by(id: params[:id])
   @actor.contents << @content
   @actor.save
   redirect_to("/contents/#{@content.id}")
  end
  
  
 
 
  
  
end

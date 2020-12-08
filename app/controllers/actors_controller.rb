class ActorsController < ApplicationController

  
  def index
    @actors = Actor.all
  end
  
  def create
    @actor = Actor.new(name: params[:name])
    @actor.save
    redirect_to("/actors/index")
  end
end

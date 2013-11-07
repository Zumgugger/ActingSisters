class ActorsController < ApplicationController
 before_action :set_actor, only: [:show]
      
  def index
    @columns = Actor.column_names[0..-3]
    @actors = Actor.order(:name)
  end #index


  def show
    set_actor
        
  end #show

  def import
    Actor.import(params[:file])
    redirect_to actors_path
  end





private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end #set_actor

end #class
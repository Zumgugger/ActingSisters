class ActorsController < ApplicationController
 before_action :set_actor, only: [:show]
      
  def index
    @columns = Actor.column_names[0..-3]
    @actors = Actor.all.sort_by {|obj| obj.name}
    @title = "Schauspieler"
    
    
  end #index


  def show
    set_actor
    @title = "Schauspieler"
    
  end #show





private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end #set_actor
    
end #class
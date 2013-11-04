class ActorsController < ApplicationController
 before_action :set_actor, only: [:show]
 helper_method :sort_column, :sort_direction
      
  def index
    @columns = Actor.column_names[0..-3]
    @actors = Actor.order(sort_column + " " + sort_direction)
    @title = "SchauspielerInnen"    
  end #index


  def show
    set_actor
    @title = "SchauspielerInnen"
    
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
    
    def sort_column
      Actor.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end #class
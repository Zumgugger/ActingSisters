class RolesController < ApplicationController
  
  before_action :set_role, only: [:show]
      
  def index
    @columns = Role.column_names[0..-3]
    @roles = Role.all.sort_by {|obj| obj.name}
    @scenes = Scene.all
    
    
  end #index


  def show
    set_role
  end #show





private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end #set_role
    
end #class
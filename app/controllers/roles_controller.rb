class RolesController < ApplicationController

      before_action :set_role, only: [:show]
      
  def index
    @columns = Role.column_names[0..-3]
    @roles = Role.all
    @list = []
    @roles.each do |r|
      @list << r.name
      end
  end


  def show
  end





private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end
    
end #class
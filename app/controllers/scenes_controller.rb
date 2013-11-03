class ScenesController < ApplicationController
  before_action :set_scene, only: [:show]
  def index
    @columns = Scene.column_names[0..-3]
    @scenes = Scene.all
    @list = []
    @scenes.each do |s|
      @list << s.number
      end
  end

  def show
    set_scene
    @scenes = Scene.all
    @end = @scenes.length
    
  end
  
  def import
    Scene.import(params[:file])
    redirect_to scenes_path
  end
end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene
      @scene = Scene.find(params[:id])
    end
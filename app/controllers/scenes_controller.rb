class ScenesController < ApplicationController
  before_action :set_scene, only: [:show]
  def index
    @scenes = Scene.all
    @list = []
    @scenes.each do |s|
      @list << s.number
      end
  end

  def show
  end
  
  def import
    Scene.import(params[:file])
    redirect_to root_url
  end
end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene
      @post = Scene.find(params[:id])
    end
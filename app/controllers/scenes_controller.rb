class ScenesController < ApplicationController
  before_action :set_scene, only: [:show, :update]
  def index
    @columns = Scene.column_names[0..-3]
    @scenes = Scene.all
    @list = []
    @scenes.each do |s|
      @list << s.number
    end #do
  end #index

  def show
    set_scene
    @scenes = Scene.all
    @end = @scenes.length
    @collection = []
    %w[casino kirche kloster ritas_zimmer draussen gangsterbüro schule ?].each do |i|
      @collection << [i, i.camelize]
    end #do
  end #show
  
  def import
    Scene.import(params[:file])
    redirect_to scenes_path
  end #import
  

  
  def update
    respond_to do |format|
      if @scene.update(scene_params)
        format.html { redirect_to @scene, notice: 'Updated' }
        format.json { head :no_content }
      else
        format.html { redirect_to @scene, notice: 'no possible Update' }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end #if
    end #do
  end #def



private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene
      @scene = Scene.find(params[:id])
    end
    
    def scene_params
      params.require(:scene).permit(:scenery)
    end
    
end #class
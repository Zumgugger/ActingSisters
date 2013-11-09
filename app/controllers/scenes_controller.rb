class ScenesController < ApplicationController
  before_action :set_scene, only: [:show, :update]
  def index
    @columns = Scene.column_names[0..-3]
    @scenes = Scene.order(:number)
    @list = []
    @scenes.each do |s|
      @list << s.number
    end #do
  end #index
  
  def new
    
  end
  
  def create
    
  end

  def show
    set_scene
    @scenes = Scene.all
    @end = @scenes.length
    @collection = []
    %w[casino kirche kloster ritas_zimmer draussen gangsterbüro schule ?].each do |i|
      @collection << [i, i.camelize]
    end #do
  end #show
  
  def edit
    
  end
  
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
  end #update

  def import
    Scene.import(params[:file])
    redirect_to scenes_path
  end #import
  
  def destroy
    
  end
  

private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene
      @scene = Scene.find(params[:id])
    end
    
    def scene_params
      params.require(:scene).permit(:scenery, :description, :summary, :text, :mood)
    end
    
end #class
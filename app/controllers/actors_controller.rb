class ActorsController < ApplicationController
 before_action :set_actor, only: [:show, :edit, :update, :destroy]
      
  def index
    @columns = Actor.column_names[0..-3]
    @actors = Actor.order(:name)
  end #index


  def show
  end #show
  
  def new
    @actor = Actor.new
  end

  def edit
  end
  
  def create
    @actor = Actor.new

    respond_to do |format|
      if @actor.save
        format.html { redirect_to actors_path, notice: 'actor was successfully created.' }
        format.json { render action: 'index', status: :created, location: @actor }
      else
        format.html { render action: 'index' }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @actor.update(actor_params)
        format.html { redirect_to @actor, notice: 'actor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json { render json: @actor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /actors/1
  # DELETE /actors/1.json
  def destroy
    @actor.destroy
    respond_to do |format|
      format.html { redirect_to actors_url }
      format.json { head :no_content }
    end
  end
  
  
  def import
    Actor.import(params[:file])
    redirect_to actors_path
  end





private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end #set_actor
    
    def actor_params
      params.require(:actor).permit(:name, :last_name, :schoolclass)
    end

end #class
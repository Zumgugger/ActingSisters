class RolesController < ApplicationController
  
  before_action :set_role, only: [:show, :edit, :update, :destroy]
      
  def index
    @roles = Role.order(:name)
    @scenes = Scene.all
  end #index
  
  def show
    @casts = Cast.all
    make_collections
  end #show
  
  def new
    @role = Role.new
  end
  
  def edit
  end
  
  def create
    @role = Role.new

    respond_to do |format|
      if @role.save
        format.html { redirect_to roles_path, notice: 'role was successfully created.' }
        format.json { render action: 'index', status: :created, location: @role }
      else
        format.html { render action: 'index' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'role was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end
  
  def import
    Role.import(params[:file])
    redirect_to roles_path
  end


private
  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end #set_role
  
  def make_collections
    categories = Category.all.order(:name)
    @categories = []
    categories.each do |c|
      @categories << [c.id, c.name]
    end
  end
    
  def role_params
    params.require(:role).permit(:name, :category_id)
  end
    
end #class
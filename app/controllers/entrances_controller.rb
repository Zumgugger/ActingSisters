class EntrancesController < ApplicationController
 
    before_action :set_entrance, only: [:show, :edit, :update, :destroy]

  # GET /entrances

  def index
    @entrances = Entrance.all
    make_collections
    @entrance = Entrance.new
  end

  # GET /entrances/1
  # GET /entrances/1.json
  def show
  end

  # GET /entrances/new
  def new
    @entrance = Entrance.new
    
  end

  # GET /entrances/1/edit
  def edit
  end

  # POST /entrances
  # POST /entrances.json
  def create
    @entrance = Entrance.new

    respond_to do |format|
      if @entrance.save
        format.html { redirect_to entrances_path, notice: 'entrance was successfully created.' }
        format.json { render action: 'index', status: :created, location: @entrance }
      else
        format.html { render action: 'index' }
        format.json { render json: @entrance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrances/1
  # PATCH/PUT /entrances/1.json
  def update
    respond_to do |format|
      if @entrance.update(entrance_params)
        format.html { redirect_to @entrance, notice: 'entrance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @entrance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrances/1
  # DELETE /entrances/1.json
  def destroy
    @entrance.destroy
    respond_to do |format|
      format.html { redirect_to entrances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entrance
      @entrance = Entrance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entrance_params
      params.require(:entrance).permit(:role_id, :scene_id, :speaking?, :singing?, :role)
    end
    
    def make_collections
      roles = Role.all.order(:name)
      scenes = Scene.all.order(:number)
      @roles = []
      @scenes = []
      roles.each do |r|
        @roles << [r.id, r.name]
      end
      scenes.each do |s|
        @scenes << [s.id, s.number]
      end
    end
end

class AllocationsController < ApplicationController
  
    before_action :set_allocation, only: [:show, :edit, :update, :destroy]

  # GET /allocations

  def index
    @allocations = Allocation.all
    make_collections
    @allocation = Allocation.new
  end

  # GET /allocations/1
  # GET /allocations/1.json
  def show
  end

  # GET /allocations/new
  def new
    @allocation = Allocation.new
    
  end

  # GET /allocations/1/edit
  def edit
  end

  # POST /allocations
  # POST /allocations.json
  def create
    @allocation = Allocation.new

    respond_to do |format|
      if @allocation.save
        format.html { redirect_to allocations_path, notice: 'allocation was successfully created.' }
        format.json { render action: 'index', status: :created, location: @allocation }
      else
        format.html { render action: 'index' }
        format.json { render json: @allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allocations/1
  # PATCH/PUT /allocations/1.json
  def update
    respond_to do |format|
      if @allocation.update(allocation_params)
        format.html { redirect_to @allocation, notice: 'allocation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allocations/1
  # DELETE /allocations/1.json
  def destroy
    @allocation.destroy
    respond_to do |format|
      format.html { redirect_to allocations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allocation
      @allocation = Allocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def allocation_params
      params.require(:allocation).permit(:role_id, :cast_id, :actor_id)
    end
    
    def make_collections
      roles = Role.all.order(:name)
      actors = Actor.all.order(:name)
      casts = Cast.all.order(:name)
      @casts = []
      @roles = []
      @actors = []
      roles.each do |r|
        @roles << [r.id, r.name]
      end
      actors.each do |a|
        @actors << [a.id, "#{a.name} #{a.last_name}"] 
      end
      casts.each do |c|
        @casts << [c.id, c.name]
      end
    end
end

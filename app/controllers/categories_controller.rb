class CategoriesController < ApplicationController
  
before_action :set_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all.order(:name)
    @category = Category.new
    get_collection
  end


  def create
    @category = Category.new

    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'category was successfully created.' }
        format.json { render action: 'index', status: :created, location: @category }
      else
        format.html { render action: 'index' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end
       
    def get_collection
      categories = Category.all.order(:name)
      
      @collection = []
      categories.each do |c|
        @collection << [c.id, c.name]
      end
    end

end

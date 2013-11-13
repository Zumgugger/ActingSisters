class NotesController < ApplicationController
 before_action :set_note, only: [:show, :edit, :update, :destroy]
      
  def index
    @notes = Note.all
  end #index


  def show
    
  end #show
  
  def new
    @note = Note.new
  end

  def edit
  end
  
  def create
    @note = Note.new

    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path, notice: 'note was successfully created.' }
        format.json { render action: 'index', status: :created, location: @note }
      else
        format.html { render action: 'index' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to @note, notice: 'note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'index' }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url }
      format.json { head :no_content }
    end
  end
  



private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.find(params[:id])
    end #set_note
    
    def note_params
      params.require(:note).permit(:name)
    end

end #class
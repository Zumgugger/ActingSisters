class MainController < ApplicationController
  def index
    @notes = Note.all
  end
end

class GenersController < ApplicationController

  def index
    @gener = Gener.all
  end
  def new
    @gener = Gener.new
  end

  def show
    @gener = Gener.find(params[:id])
  end

  def create
    Gener.transaction do
     @gener = Gener.new(audio_params)
   if @gener.save
       redirect_to group_index_path
     else
        render 'new'
     end
   end
  end

  private def audio_params
      params.require(:gener).permit(:name)
  end

end

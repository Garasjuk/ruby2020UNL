class AlbomsController < ApplicationController

  def index
    @albom = Albom.all
  end

  def new
    @group = params[:group_id]
    @albom = Albom.new
    @gener = Gener.all



  end

  def edit
    @albom = albom.find(params[:id])
  end

  def show
    @albom = Albom.where(id: params[:id])
    @song = Song.where(albom_id: params[:id])

  end

  def update
    @albom = albom.find(params[:id])
    if @albom.update()
      redirect_to albom_path
    else
      render 'new'
    end
  end

  def destroy
      @albom = Albom.find(params[:id])
      @song = Song.where(albom_id: params[:id])
      @song.destroy
      @albom.destroy
      redirect_to group_path(params[:id])

  end

  def create
    #   render plain: params[:albom].inspect

     #@group = Group.where(params[:group_id])
     @albom = Albom.create(audio_params)



     #@albom = Albom.last
     #Song.find_or_create_by(name: params[song: :name], albom_id: @albom)

     # Albom.new(audio_params)


     # Song.new(audio_params::song) # albom_id: @albom )

     if @albom.save
        @song = @albom.song.build
      #  @albom = Albom.last
      #  @song = Song.new(params.require(:albom).permit(song_attributes: [:name]), albom_id: @albom )
        @song.save
         # albom_id: @albom )

        #
        # # Song.find_or_create_by(name: params[song: :name], albom_id: @albom)
        # Song.find_or_create_by(albom_id: @albom)

       redirect_to group_path(params[:group_id])
     else
        render 'new'
     end
  end

  private def audio_params

      params.require(:albom).permit(:name, :description, :image, :group_id, :artist_id, :gener_id, song_attributes: [:name])
  end

end

class SubjectsController < ApplicationController

  def index
    @subject = Subject.all
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def edit
      @subject = authorize Subject.find(params[:id])
      # @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def update
    @subject = Subject.find(params[:id])
    # authorize @subject
    if @subject.update(subject_params)
     redirect_to subjects_path
     # , success: 'Update success'
    else
      render :edit
      # , danger: 'Update bad'
    end
  end

  def create
    @subject = Subject.new(subject_params)
    authorize @subject 
      if @subject.save
        redirect_to subjects_path
        # new_meme_in_path(author: meme_params[:author])
        #redirect_to memes_path, success: 'Create new meme'
      else
        render :new
      end
  end


  def destroy
    @subject = Subject.find(params[:id])
    authorize @subject
    @subject.destroy
    redirect_to subjects_path
    # , info: 'Delete success'
  end

  private def subject_params
    params.require(:subject).permit(:topic, :description, :status)
  end
end

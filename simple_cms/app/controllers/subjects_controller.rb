class SubjectsController < ApplicationController

  layout 'admin'

  def index
    @subjects = Subject.sorted
    #render('index')
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)
    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Successfully created..."
      redirect_to(subjects_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @subject = Subject.find(params[:id])

    # Update the object
    flash[:notice] = "Successfully updated..."
    if @subject.update_attributes(subject_params)
      # If save succeeds, redirect to the show action
      redirect_to(subject_path(@subject))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Successfully deleted '#{@subject.name}'..."
    redirect_to(subjects_path)
  end

  private
    def subject_params

      params.require(:subject).permit(:name, :position, :visible)

    end
end

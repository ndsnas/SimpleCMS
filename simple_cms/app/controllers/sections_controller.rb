class SectionsController < ApplicationController

  layout 'admin'

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end

  def create
    #@page = Page.find(3)
    @section = Section.new(section_params)
    #@page.sections << @section

    if @section.save
      flash[:notice] = "Successfully created..."
      redirect_to(sections_path)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
  end

  def update
    @section = Section.find(params[:id])

    if @section.update_attributes(section_params)
      flash[:notice] = "Successfully updated..."
      redirect_to(section_path(@section))
    else
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = "Successfully deleted..."
    redirect_to(sections_path)
  end

  private
    def section_params

      params.require(:section).permit(:page_id, :name, :position, :visible, :content_type, :content)

    end

end

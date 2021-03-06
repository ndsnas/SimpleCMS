class PagesController < ApplicationController

  layout 'admin'

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
    @subjects = Subject.sorted
  end

  def create
    #@subject = Subject.find(1)
    @page = Page.new(page_params)
    #@subject.pages << @page

    if @page.save
      flash[:notice] = "Successfully created..."
      redirect_to(pages_path)
    else
      @page_count = Page.count + 1
      @subjects = Subject.sorted
      render('new')

    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count
    @subjects = Subject.sorted
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Successfully updated..."
      redirect_to(pages_path(@page))
    else
      @page_count = Page.count
      @subjects = Subject.sorted
      render('edit')

    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Successfully deleteded..."
    redirect_to(pages_path)
  end

  private
    def page_params

      params.require(:page).permit(:subject_id, :name, :position, :visible, :permalink)

    end

end

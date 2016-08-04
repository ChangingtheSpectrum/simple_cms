class SectionsController < ApplicationController

  layout "admin"

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new(:name => "Default")
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "Section created!"
      redirect_to(:action => 'index')
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
    flash[:notice] = "Section updated!"

      # If update succeeds, redirect to the show page
      redirect_to(:action => 'show', :id => @section.id)
    else
      # Renders a new page so the user can fix the problem
      render('new')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Section '#{section.name}' destroyed!"
    redirect_to(:action => 'index')
  end

  private
    def section_params
      params.require(:section).permit(:page_id, :name, :position, 
        :visible, :content_type, :content)
    end

end

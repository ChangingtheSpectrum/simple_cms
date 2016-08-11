class SubjectsController < ApplicationController
  
  layout "admin"

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(:name => "Default")
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject created!"
      redirect_to(:action => 'index')
    else
      @subject_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    # Find an existing object using form parameters
    @subject = Subject.find(params[:id])
    # Update the object
    if @subject.update_attributes(subject_params)
    flash[:notice] = "Subject updated!"

      # If update succeeds, redirect to the show page
      redirect_to(:action => 'show', :id => @subject.id)
    else
      # Renders a new page so the user can fix the problem
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' deleted!"
    redirect_to(:action => 'index')
  end
  private

    def subject_params
      # params.require(:subject) raises an error if :subject is not present
      # .permit allows :name, :position, and :visible to be mass-assigned
      params.require(:subject).permit(:name, :position, :visible)
    end

end

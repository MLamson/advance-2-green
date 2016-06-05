class ConceptsController < ApplicationController
  
  def index
    @concepts = Concept.all
  end
  
  
  def new
    @concept = Concept.new
  end
  
  def edit
    @concept = Concept.find(params[:id])
  end
  
  def create
    
    @concept = Concept.new(concept_params)
    if @concept.save
      flash[:notice] = "Concept was successfully created"
      redirect_to concept_path(@concept)
    else
      render 'new'
    end
  end
  
  def update
    @concept = Concept.find(params[:id])
    if @concept.update(concept_params)
      flash[:notice] = "Concept was successfully updated"
      redirect_to concept_path(@concept)
    else
      render 'edit'
    end
    
  end
 
  
  def show
    @concept = Concept.find(params[:id])
  end
  
  def destroy
    @concept = Concept.find(params[:id])
    @concept.destroy
    flash[:notice] = "Concept was successfully deleted"
    redirect_to concepts_path
  end
  
  private
  def concept_params
    params.require(:concept).permit(:description, :status, :link, :category, :name, :email, :need)
  end
end
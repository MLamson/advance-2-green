class ConceptsController < ApplicationController
  def new
    @concept = Concept.new
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
  
  def show
    @concept = Concept.find(params[:id])
  end
  
  private
  def concept_params
    params.require(:concept).permit(:description, :status, :link, :category, :name, :email, :need)
  end
end
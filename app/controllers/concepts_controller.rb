class ConceptsController < ApplicationController
  def new
    @concept = Concept.new
  end
  
  def create
    #render plain: params[:concept].inspect
    @concept = Concept.new(concept_params)
    @concept.save
    redirect_to concepts_show(@concept)
  end
  
  private
  def concept_params
    params.require(:concept).permit(:description, :status, :link, :category, :name, :email, :need)
  end
end
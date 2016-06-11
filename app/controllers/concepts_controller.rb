class ConceptsController < ApplicationController
  
  before_action :set_concept, only: [:edit, :update, :show, :destroy]
  
  def index
    @concepts = Concept.paginate(page: params[:page], per_page: 4)
  end
  
  
  def new
    @concept = Concept.new
  end
  
  def edit
  end
  
  def create
    @concept = Concept.new(concept_params)
    @concept.user = User.first
    if @concept.save
      flash[:success] = "Concept was successfully created"
      redirect_to concept_path(@concept)
    else
      render 'new'
    end
  end
  
  def update
    if @concept.update(concept_params)
      flash[:success] = "Concept was successfully updated"
      redirect_to concept_path(@concept)
    else
      render 'edit'
    end
    
  end
 
  
  def show
  end
  
  def destroy
    @concept.destroy
    flash[:danger] = "Concept was successfully deleted"
    redirect_to concepts_path
  end
  
  private
  def concept_params
    params.require(:concept).permit(:description, :status, :link, :category, :name, :email, :need)
  end
  
  def set_concept
    @concept = Concept.find(params[:id])
  end
end
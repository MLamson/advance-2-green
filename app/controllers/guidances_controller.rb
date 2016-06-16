class GuidancesController < ApplicationController
  
  before_action :set_guidance, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @guidances = Guidance.paginate(page: params[:page], per_page: 4)
  end
  
  def new
    @guidance = Guidance.new
  end
  
  def create
    @guidance = Guidance.new(guidance_params)
    @guidance.user = current_user
    if @guidance.save
      flash[:success] = "Guidance was successfully created"
      redirect_to guidance_path(@guidance)
    else
      render 'new'
    end
  end
  
  def update
    if @guidance.update(guidance_params)
      flash[:success] = "Guidance was successfully updated"
      redirect_to guidance_path(@guidance)
    else
      render 'edit'
    end
    
  end
  
  def show
  
  end
  
   def destroy
    @guidance.destroy
    flash[:danger] = "Guidance was successfully deleted"
    redirect_to stories_path
  end
  
  private
  def guidance_params
    params.require(:guidance).permit(:title, :author, :author_bio, :email, :web, :guidance)
  end
  
  def set_guidance
    @guidance = Guidance.find(params[:id])
  end
  
  def require_same_user
    if current_user != @guidance.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own stories"
      redirect_to root_path
    end
  end
  
  
end
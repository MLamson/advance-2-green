class ResourcesController < ApplicationController
  
  before_action :set_resource, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @resources = Resource.paginate(page: params[:page], per_page: 4)
  end
  
  def new
    @resource = Resource.new
  end
  
  def create
    @resource = Resource.new(resource_params)
    @resource.user = current_user
    if @resource.save
      flash[:success] = "Resource was successfully created"
      redirect_to resource_path(@resource)
    else
      render 'new'
    end
  end
  
  def update
    if @resource.update(resource_params)
      flash[:success] = "Resource was successfully updated"
      redirect_to resource_path(@resource)
    else
      render 'edit'
    end
    
  end
  
  def show
  
  end
  
   def destroy
    @resource.destroy
    flash[:danger] = "Resource was successfully deleted"
    redirect_to resources_path
  end
  
  private
  def resource_params
    params.require(:resource).permit(:business_name, :resource, :web, :name, :email, :phone, :street, :city_state_zip)
  end
  
  def set_resource
    @resource = Resource.find(params[:id])
  end
  
  def require_same_user
    if current_user != @resource.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own resources"
      redirect_to root_path
    end
  end
  
  
end
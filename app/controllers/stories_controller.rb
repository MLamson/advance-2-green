class StoriesController < ApplicationController
  
  before_action :set_story, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    @stories = Story.paginate(page: params[:page], per_page: 4)
  end
  
  def new
    @story = Story.new
  end
  
  def create
    @story = Story.new(story_params)
    @story.user = current_user
    if @story.save
      flash[:success] = "Story was successfully created"
      redirect_to story_path(@story)
    else
      render 'new'
    end
  end
  
  def update
    if @story.update(story_params)
      flash[:success] = "Story was successfully updated"
      redirect_to story_path(@story)
    else
      render 'edit'
    end
    
  end
  
  def show
  
  end
  
   def destroy
    @story.destroy
    flash[:danger] = "Story was successfully deleted"
    redirect_to stories_path
  end
  
  private
  def story_params
    params.require(:story).permit(:title, :author, :author_bio, :email, :web, :story)
  end
  
  def set_story
    @story = Story.find(params[:id])
  end
  
  def require_same_user
    if current_user != @story.user and !current_user.admin?
      flash[:danger] = "You can only edit or delete your own stories"
      redirect_to root_path
    end
  end
  
  
end
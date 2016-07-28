class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]
  def index
    @users = User.paginate(page: params[:page], per_page: 4)
  end
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Advance2Green #{@user.username}, Please confirm your email address."
      redirect_to user_path(@user)
    else
      flash[:error] = "Error: Did not create confirmation email"
      render 'new'
    end
  end
  
  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user_params
      user.email_activate
      flash[:success] = "Welcome to A2Green! Your account has been confirmed"
      redirect_to root_path
    else
      flash[:error] = "Error: User does not exist"
      redirect_to root_path
    end
  end
  
  def edit
    
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to concepts_path
    else
      render 'edit'
    end
  end
  
  def show
    @user_concepts = @user.concepts.paginate(page: params[:page], per_page: 2)
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User and all concepts created by user have been deleted"
    redirect_to users_path
  end
  
  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  def set_user
    @user = User.find(params[:id])
  end
  
  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end
  
  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin can perform that action"
      redirect_to root_path
    end
  end
  
end
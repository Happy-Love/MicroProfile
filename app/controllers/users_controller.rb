class UsersController < ApplicationController
  before_action :owner?, only: %i[edit destroy]
  def index
    @users = User.all
  end

  def show
    @user  = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  # def new
  #   @user = User.new
  # end

  def edit
    @user = User.find(params[:id])
  end

  #def create
  #  @user = User.new(user_params)
  #  if @user.save
  #    redirect_to @user
  #  else
  #    render 'new'
  #  end
  #end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(current_user.id)
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :firstname, :lastname, :password)
  end

  
  def owner?
    unless current_user == User.find(params[:id])
      redirect_back fallback_location: root_path, notice: 'User is not owner'
    end
  end
  
  
end

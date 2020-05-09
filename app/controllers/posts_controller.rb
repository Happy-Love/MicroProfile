class PostsController < ApplicationController
  before_action :owner?, only: %i[edit destroy]
    
  def create
    Post.create(post_params)
    redirect_to root_path
  end
  
  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comments = Comment.where(post_id: @post).order("created_at DESC")
  end

  def destroy
    
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to user_path(current_user)
  end

  

  private

  def post_params
    params.require(:post).permit(:description, :image, :user_id)
  end

  def owner?
    @post=Post.find(params[:id])
    unless current_user == @post.user || !current_user.nil?  
      redirect_back fallback_location: root_path, notice: 'User is not owner'
    end
  end
end

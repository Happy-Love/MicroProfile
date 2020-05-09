class CommentsController < ApplicationController
  before_action :find_post
  
  def create
    @comment=@post.comments.create(params[:comment].permit(:content))
    @comment.user_id=current_user.id
    @comment.save
    if @comment.save
      redirect_to user_post_path(@post.user_id, @post.id)
    else
      render 'new'
    end  
  end
  
  def find_post
    @post=Post.find(params[:post_id])
  end
  

end
class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user
  def create
    current_user.follow(@user)
    redirect_to user_path(@user.id)    
  end

  def destroy
    current_user.unfollow(@user)
    redirect_to user_path(@user.id)    
  end
  
  private

  def find_user
    @user=User.find(params[:user_id])  
    if @user==current_user
      flash[:error]="Нельзя подписаться на самого себя"
      redirect_to user_path(@user.id)
    end  
  end
  

end

class FollowsController < ApplicationController
  def new
    @friendship = Follow.new
  end

  def create
    @friendship = current_user.follows.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = 'Friendship was saved correctly.'
      redirect_back(fallback_location: root_path)
    else
      flash[:notice] = 'nop'
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    friend = User.find(params[:id])
    friendship = friend.follows.find_by(friend_id: current_user.id)
    if current_user.friend_requests.include?(friend)
      friendship.confirm_friend
      flash[:notice] = 'Friendship was confirmed correctly.'
      redirect_back(fallback_location: user_path)
    else
      flash[:notice] = 'Try again'
      render :update
    end
  end

  def destroy
    friend = User.find(params[:id])
    friendship = friend.follows.find_by(friend_id: current_user.id)

    flash[:notice] = if friendship.destroy
                       'Friendship was rejected.'
                     else
                       'Some error happened.'
                     end
    redirect_back(fallback_location: user_path)
  end

  private

  def params_friendship
    params.require(:follow).permit(:friend_id)
  end
end

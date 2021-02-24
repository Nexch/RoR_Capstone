module UsersHelper
  def user_follow(lol)
    return unless current_user.id.to_i != params[:id].to_i
      if Follow.where(user_id: current_user, friend_id: params[:id]) == []
        form_with model: @friendship, url: follows_path do |f|
          f.hidden_field :friend_id, value: lol
          f.submit 'Follow', type: :image, src: 'https://cdn2.iconfinder.com/data/icons/everything-but-the-kitchen-sink-2/100/common-06-512.png', id: 'lol', alt: 'Take'
        end

      else
        content_tag(:h5) do
          link_to 'Unfollow', follow_path, method: :delete
        end
      end
  end
end

module TweetsHelper
  def if_list(tweet, list)
    return unless tweet.id != current_user.id

    return unless list.exclude?(tweet.id)

    content_tag(:td) do
      concat link_to(tweet.name, tweet, class: 'text-primary')
      concat ' '
    end
  end
end

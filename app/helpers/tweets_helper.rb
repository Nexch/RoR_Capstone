module TweetsHelper
  def if_list(tweet, list)
    return if list.exclude?(tweet.id) && tweet.id != current_user.id

    content_tag(:td) do
      concat link_to(tweet.name, tweet, class: 'text-primary')
      concat ' '
    end
  end
end

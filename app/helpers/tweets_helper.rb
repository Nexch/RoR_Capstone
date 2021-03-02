module TweetsHelper
  def if_list(tweet, list)
    return unless tweet.id != current_user.id

    return unless list.exclude?(tweet.id)

    content_tag(:td) do
      concat link_to(tweet.name, tweet, class: 'text-primary')
      concat ' '
    end
  end

  def if_voter(tweet)
    if !tweet.find_votes_for(voter_id: current_user.id).empty?
      link_to 'Dislike', dislike_tweet_path(tweet), class: 'text-primary', method: :put
    else
      link_to 'Like', like_tweet_path(tweet), class: 'text-primary', method: :put
    end
  end
end

class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /tweets or /tweets.json

  def like
    @lol = Tweet.find(params[:id])
    @lol.liked_by current_user
    redirect_to :root
  end

  def dislike
    @lol = Tweet.find(params[:id])
    @lol.unliked_by current_user
    redirect_to :root
  end

  def index
    @tweets = Tweet.all
    @user = User.all
  end

  # GET /tweets/1 or /tweets/1.json
  def show; end

  # GET /tweets/new
  def new
    @tweet = current_user.tweets.build
  end

  # POST /tweets or /tweets.json
  def create
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to root_path, notice: 'Tweet was successfully created.' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tweet_params
    params.require(:tweet).permit(:tweet)
  end
end

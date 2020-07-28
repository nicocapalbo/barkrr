class TweetsController < ApplicationController

  # def index
  #   @user = User.find(params[:user_id])
  #   @tweets = User.find(params[:user_id]).tweets.order("created_at DESC")
  # end

  def create
    if Following.find_by(followed_id: 1, follower_id: 1).nil?
      Following.create(followeed_id: current_user.id, follower_id: current_user.id)
    end
    @user = User.find(current_user.id)
    @tweet = Tweet.new(tweet_params)
    @tweet.user = @user
    if @tweet.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end

end

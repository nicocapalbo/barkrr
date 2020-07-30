class TweetsController < ApplicationController
  def create
    if Following.find_by(followed_id: current_user.id, follower_id: current_user.id).nil?
      Following.create(followed_id: current_user.id, follower_id: current_user.id)
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

  def like
    # Tweet.first.favorites.create(user_id: 30)
    @tweet = Tweet.find(params[:id])
    if !current_user.liked?(params[:id])
      @like = @tweet.favorites.create(user_id: current_user.id)
    else
      @unlike = @tweet.favorites.find_by(user_id: current_user.id).destroy
    end

    respond_to do |format|
      format.html {}
      format.json { render json: { count: @tweet.total_favs, like: current_user.liked?(params[:id]) } }
    end

  end

  private

  def tweet_params
    params.require(:tweet).permit(:text)
  end

end

class TweetsController < ApplicationController
  before_action :require_admin_status, only: [:edit, :update]

  def index
    @lesson = Lesson.find_by(id: params[:id])
    if @lesson == nil
      redirect_to lessons_url
    end
    cookies["current_lesson_id"] = params[:id]
  end

  def new
    @tweet = Tweet.new
  end

  def show
  end

  def create
    @tweet = Tweet.new
    @tweet.text = params[:tweet][:text]
    @tweet.cited_src = params[:tweet][:cited_src]
    @tweet.lesson_id = cookies["current_lesson_id"]
    @tweet.approved = true
    if @tweet.save
      if @tweet.text.length > 264
        flash[:warning] = "The tweet you just created is more than 264 characters. This may cause problems
        with twitter's character limits, especially when responding to users with long user name. If the
        tweet includes a URL then you should be fine but we'd recommend checking it against twitter before
        going ahead."
      end
      # create a new contribution for editor
      contribution = Contribution.new
      contribution.lesson_id = @tweet.lesson_id
      contribution.user_id = current_user.id
      contribution.creator = false
      contribution.save

      redirect_to tweets_url(id: @tweet.lesson_id)
    else
      render :new and return
    end
  end

  def edit
    @tweet = Tweet.find_by(id: params[:id])
  end

  def update
    tweet = Tweet.find_by(id: params[:id])
    tweet.text = params[:tweet][:text]
    tweet.cited_src = params[:tweet][:cited_src]
    tweet.save

    contribution = Contribution.new
    contribution.lesson_id = tweet.lesson_id
    contribution.user_id = current_user.id
    contribution.creator = false
    contribution.save

    redirect_to tweets_url(id: tweet.lesson_id)
  end

private

  def require_admin_status
    unless current_user.admin?
      redirect_to lessons_url
    end
  end

end
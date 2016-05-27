class TweetsController < ApplicationController

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
    tweet = Tweet.new
    tweet.text = params[:tweet][:text]
    tweet.lesson_id = cookies["current_lesson_id"]
    tweet.approved = true
    tweet.save

    # create a new contribution for editor
    contribution = Contribution.new
    contribution.lesson_id = tweet.lesson_id
    contribution.user_id = session["user_id"]
    contribution.creator = false
    contribution.save

    redirect_to tweets_url(id: tweet.lesson_id)
  end

  def edit
    @tweet = Tweet.find_by(id: params[:id])
  end

  def update
    tweet = Tweet.find_by(id: params[:id])
    tweet.text = params[:tweet][:text]
    tweet.save

    # create a new contribution for editor
    contribution = Contribution.new
    contribution.lesson_id = tweet.lesson_id
    contribution.user_id = session["user_id"]
    contribution.creator = false
    contribution.save

    redirect_to tweets_url(id: tweet.lesson_id)
  end


end
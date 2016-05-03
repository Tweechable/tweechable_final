class LessonsController < ApplicationController

  def index
    @lessons = Lesson.all
  end

  def show
    @lesson = Lesson.find_by(id: params[:id])
  end

  def new
    @lesson = Lesson.new
  end

  def create
    lesson = Lesson.new
    lesson.hash_tag = params[:lesson][:hash_tag]
    lesson.created_at = params[:lesson][:date]
    lesson.tweet1 = params[:lesson][:tweet1]
    lesson.tweet2 = params[:lesson][:tweet2]
    lesson.tweet3 = params[:lesson][:tweet3]
    lesson.tweet4 = params[:lesson][:tweet4]
    lesson.tweet5 = params[:lesson][:tweet5]
    lesson.save
    redirect_to lessons_url
  end

  def edit
    @lesson = Lesson.find_by(id: params[:id])
  end

  def update
    lesson = Lesson.find_by(id: params[:id])
    lesson.hash_tag = params[:lesson][:hash_tag]
    lesson.created_at = params[:lesson][:date]
    lesson.tweet1 = params[:lesson][:tweet1]
    lesson.tweet2 = params[:lesson][:tweet2]
    lesson.tweet3 = params[:lesson][:tweet3]
    lesson.tweet4 = params[:lesson][:tweet4]
    lesson.tweet5 = params[:lesson][:tweet5]
    lesson.save
    redirect_to lessons_url
  end

  def destroy
    lesson = Lesson.find_by(id: params[:id])
    if lesson
      lesson.delete
    end
    redirect_to lessons_url
  end



end
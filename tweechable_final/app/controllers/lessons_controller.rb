class LessonsController < ApplicationController

  def index
    @lessons = Lesson.where(approved: true)
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
    lesson.category = params[:lesson][:category]
    lesson.description = params[:lesson][:description]
    lesson.approved = true
    lesson.save
    cookies["new_lesson_id"] = lesson.id
    #redirect_to tweets_url
    redirect_to tweets_url(id:lesson.id)
  end

  def edit
    @lesson = Lesson.find_by(id: params[:id])
  end

  def update
    lesson = Lesson.find_by(id: params[:id])
    lesson.hash_tag = params[:lesson][:hash_tag]
    lesson.created_at = params[:lesson][:date]
    lesson.description = params[:lesson][:description]
    lesson.approved = true
    lesson.save
    redirect_to lesson_url(lesson.id)
  end

  def destroy
    lesson = Lesson.find_by(id: params[:id])
    if lesson
      lesson.delete
    end
    redirect_to lessons_url
  end



end
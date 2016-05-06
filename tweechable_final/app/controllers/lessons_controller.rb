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
    lesson.t1 = params[:lesson][:t1]
    lesson.t2 = params[:lesson][:t2]
    lesson.t3 = params[:lesson][:t3]
    lesson.t4 = params[:lesson][:t4]
    lesson.t5 = params[:lesson][:t5]
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
    lesson.t1 = params[:lesson][:t1]
    lesson.t2 = params[:lesson][:t2]
    lesson.t3 = params[:lesson][:t3]
    lesson.t4 = params[:lesson][:t4]
    lesson.t5 = params[:lesson][:t5]
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
class LessonsController < ApplicationController

  def index
    @lessons = Lesson.where(approved: true).limit(30)
    @lessons_all = Lesson.all
    if params[:keyword].present?
      @lessons = @lessons_all.where("hash_tag LIKE ? OR description LIKE ? OR category LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%","%#{params[:keyword]}%")
    end

    respond_to do |format|
      format.html do
        render 'index'
      end
      format.json do
        render json: @lessons_all
      end
      format.xml do
        render xml: @lessons_all
      end
    end

  end

  def show
    @lesson = Lesson.find_by(id: params[:id])
    @contributors = Array.new
    @lesson.contributions.each do |contributor|
      if contributor.creator
        @creator = contributor.user.name
      else
        @contributors << contributor.user.name
      end
    end
    return @lesson, @creator, @contributors.uniq!
  end

  def new
    @user = User.find_by(id: params[:id])
    @lesson = Lesson.new
    return @user, @lesson
  end

  def create
    lesson = Lesson.new
    lesson.hash_tag = params[:lesson][:hash_tag]
    lesson.created_at = Time.now
    lesson.category = params[:lesson][:category]
    lesson.description = params[:lesson][:description]
    lesson.approved = true
    lesson.save
    cookies["new_lesson_id"] = lesson.id

    # create a new contribution for creator
    contribution = Contribution.new
    contribution.lesson_id = lesson.id
    contribution.user_id = session["user_id"]
    contribution.creator = true
    contribution.save

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

    # create a new contribution for editor
    contribution = Contribution.new
    contribution.lesson_id = lesson.id
    contribution.user_id = session["user_id"]
    contribution.creator = false
    contribution.save

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
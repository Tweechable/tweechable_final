class LessonsController < ApplicationController
  before_action :is_admin?, :only => [:edit]
  before_action :find_lesson, :except => [:index, :create, :new, :edit]



  def find_lesson
    @lesson = Lesson.find_by(id: params[:id])
  end

  def index
    # @lessons = Lesson.where(approved: true)
    @lessons = Lesson.where(approved: true).paginate(:page => params[:page], :per_page => 10)
    @lessons_all = Lesson.all
    if params[:keyword].present?
      @lessons = @lessons_all.where("hash_tag LIKE ? OR description LIKE ? OR category LIKE ?", "%#{params[:keyword]}%", "%#{params[:keyword]}%","%#{params[:keyword]}%").paginate(:page => params[:page], :per_page => 10)
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
    lesson.intro = params[:lesson][:intro]
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
    # cannot update unless curr user is admin
    if (current_user)
      if (current_user.admin)
        @lesson.hash_tag = params[:lesson][:hash_tag]
        @lesson.created_at = params[:lesson][:date]
        @lesson.description = params[:lesson][:description]
        @lesson.approved = true
        @lesson.save

        # create a new contribution for editor
        contribution = Contribution.new
        contribution.lesson_id = @lesson.id
        contribution.user_id = session["user_id"]
        contribution.creator = false
        contribution.save

        redirect_to lesson_url(@lesson.id)
      else 
        redirect_to lessons_path
      end  
    end

    
  end

  def destroy
    if @lesson
      @lesson.delete
    end
    redirect_to lessons_url
  end



end
class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    if !@user || !current_user || (@user.id != current_user.id)
      redirect_to root_url
    end
    contributions = @user.contributions
    @created_lessons = Array.new
    @edited_lessons = Array.new
    contributions.each do |contribution|
      lesson = Lesson.find_by(id: contribution.lesson_id)
      if lesson
        if contribution.creator
          @created_lessons << lesson
        else
          @edited_lessons << lesson
        end
      end
    end
    return @user, @created_lessons.uniq!, @edited_lessons.uniq!
  end

  def index
    redirect_to lessons_url
  end

  def new
    @user = User.new
  end

  def destroy
    User.delete(params[:id])
    redirect_to users_url
  end

end

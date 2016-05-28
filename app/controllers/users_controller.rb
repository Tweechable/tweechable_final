class UsersController < ApplicationController

  def show
    @user = User.find_by(id: params[:id])
    if !@user || (@user.id != session[:user_id].to_i)
      redirect_to root_url
    end
    contributions = @user.contributions
    @created_lessons = Array.new
    @edited_lessons = Array.new
    contributions.each do |contribution|
      if contribution.creator
        @created_lessons << Lesson.find_by(id: contribution.lesson_id)
      else
        @edited_lessons << Lesson.find_by(id: contribution.lesson_id)
      end
    end
    return @user, @created_lessons.uniq!, @edited_lessons.uniq!
  end

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create

    user_params = params.require(:name,:email,:password).permit(:how_found_tweechable)
    # user.name = params[:user][:name]
    # user.email = params[:user][:email]
    # user.password = params[:user][:password]
    # user.how_found_tweechable = params[:user][:how_found_tweechable]
    @new_user = User.new(user_params)
    @new_user.created_at = Time.now
    @new_user.updated_at = Time.now
    @new_user.admin = false
    @new_user.save
    redirect_to lessons_url
  end

  def destroy
    User.delete(params[:id])
    redirect_to users_url
  end
end

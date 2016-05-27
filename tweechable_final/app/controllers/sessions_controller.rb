class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        flash["notice"] = "Welcome back, #{user.name}"
        redirect_to lessons_url
        return
      else
        # Email is ok, but password was wrong
      end
    else
      # Email is unknown
    end
    redirect_to login_url, notice: "Invalid email or password"
  end

  def destroy
    reset_session
    redirect_to root_url
  end

end

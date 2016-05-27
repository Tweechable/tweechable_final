class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:email])
    if user
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        flash["notice"] = "Welcome back, #{user.name}"
        user.updated_at = Time.now
        user.save
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
    session.delete(:message)
    reset_session
    redirect_to root_url
  end

end

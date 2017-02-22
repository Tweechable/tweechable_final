class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #redirects to root if not admin
  def is_admin?
    if (session.nil?) 
      redirect_to root_path
    elsif (session[:user_id].nil?)
      redirect_to root_path
    else
      # do nothing if is admin
    end
  end
end


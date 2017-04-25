class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #redirects to root if not admin
  def is_admin?
    unless current_user and current_user.admin
      redirect_to root_path
    end
  end
end


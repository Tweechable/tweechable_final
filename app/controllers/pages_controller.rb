class PagesController < ApplicationController
  before_action :check_admin, :only => [:show]


  def show
    if valid_page?
      render template: "pages/#{params[:page]}"
    else
      render file: 'public/404.html', status: :not_found
    end
  end

  # Attribution: http://blog.teamtreehouse.com/static-pages-ruby-rails
  private
  def valid_page?
    File.exist?(Pathname.new(Rails.root + "app/views/pages/#{params[:page]}.html.erb"))
  end

  # The array in this function should include the names of all static pages which require the
  # user to be an admin to access
  def check_admin
    if ["admin", "team"].include? params[:page]
      is_admin?
    end
  end
end

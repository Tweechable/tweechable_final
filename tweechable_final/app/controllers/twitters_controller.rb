class TwittersController < ApplicationController

  def create
    educatee = Educatee.new
    educatee.lesson_id = 1
    educatee.hash_tag = params[:hash_tag]
    educatee.twitter_handle = params[:twitter_handle]
    educatee.educated = false
    educatee.save
    @lesson = Lesson.find_by(hash_tag: params[:hash_tag])
    if @lesson
      twitters = Twitter_API.new
      @client = twitters.client
      # (0..5).each do |i|
      #  to_send = @lesson[('t'+i.to_s)].slice!(0..139)
      to_send = "#{params[:twitter_handle]} #{@lesson['t1']}".slice!(0..139)
      puts to_send
      @client.update(to_send)
    end
    redirect_to '/twitters'
  end

end
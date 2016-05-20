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
      to_send = @lesson.tweets[0].text
      puts to_send
      @client.update(to_send)
    end
    redirect_to '/twitters'
  end

end
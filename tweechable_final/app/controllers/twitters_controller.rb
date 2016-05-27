class TwittersController < ApplicationController

  def create
    educatee = Educatee.new
    educatee.lesson_id = Lesson.find_by(hash_tag: params[:hash_tag]).id
    educatee.twitter_handle = params[:twitter_handle]

    # I don't really need this field now given how the current site functions but
    # I need it in the future to store requests and time out the twitter bot's response rate
    # so my tweets aren't considered spams and get my account banned. yay..
    educatee.educated = true

    educatee.save
    @lesson = Lesson.find_by(hash_tag: params[:hash_tag])

    if @lesson
      twitters = Twitter_API.new
      @client = twitters.client

    # only sending out one tweet for now for demo
      to_send = @lesson.tweets[0].text + params[:twitter_handle]
      @client.update(to_send)
    end
    redirect_to '/twitters'
  end

end
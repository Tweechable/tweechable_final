class EducateesController < ApplicationController

  def index

  end

  def new

  end

  def create
    educatee = Educatee.new
    @lesson = find_lesson_from_hash_tag()

    if @lesson
      educatee.lesson_id = @lesson.id
      educatee.twitter_handle = params[:twitter_handle]
      educatee.created_at = Time.now
      educatee.save

      twitters = Twitter_API.new
      @client = twitters.client

      # only sending out one tweet for now for demo
      # add the blank two make sure we can tag! otherwise it'd be one string
      to_send = @lesson.tweets[0].text + ' ' + params[:twitter_handle]
      @client.update(to_send)

      # ehhh don't know if there's a call back from twitter. for now just crudely update this..
      educatee = Educatee.find_by(twitter_handle: params[:twitter_handle], lesson_id: @lesson.id)
      educatee.educated = true
      educatee.save

    else
      # redirect to lessons not found
    end

    redirect_to '/educatees'
  end

  def find_lesson_from_hash_tag
    @lesson = Lesson.find_by(hash_tag: params[:hash_tag])
  end

end
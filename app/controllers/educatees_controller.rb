class EducateesController < ApplicationController

  def index

  end

  def new

  end

  def create
    educatee = Educatee.new
    @lesson = Lesson.find_by(hash_tag: params[:hash_tag])

    if @lesson
      educatee.lesson_id = @lesson.id
      educatee.twitter_handle = params[:twitter_handle]
      educatee.created_at = Time.now
      educatee.save

      twitters = Twitter_API.new
      @client = twitters.client

      # only sending out one tweet for now for demo
      # add the blank two make sure we can tag! otherwise it'd be one string
      # sort by the index to get the tweets in the correct order
      tweets = @lesson.tweets.order(:index)
      # first = tweets.shift
      rest = tweets
      #
      # first_ttext = first.text + ' ' + params[:twitter_handle]
      # @client.update(first_ttext)

      rest.each do |t|
        if t.cited_src
          ttext = t.text + ' ' + t.cited_src + ' ' + params[:twitter_handle]
        else
          ttext = t.text + ' ' + params[:twitter_handle]
        end
        @client.update(ttext)
      end

      # ehhh don't know if there's a call back from twitter. for now just crudely update this..
      educatee = Educatee.find_by(twitter_handle: params[:twitter_handle], lesson_id: @lesson.id)
      educatee.educated = true
      educatee.save

      redirect_to '/educatees'

    else
      # if there is no such hash tag redirect to lessons not found
      redirect_to '/pages/lesson_not_found'

    end






  end

end
